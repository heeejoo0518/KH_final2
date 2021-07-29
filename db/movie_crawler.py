# -*- coding:utf-8 -*-
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException

import os
import sys
import json
from collections import OrderedDict


driver = webdriver.Chrome("C:/Users/abcd_/Desktop/final_project/crawler/chromedriver.exe")
url = "https://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=pnt&date=20210616&page=" # 랭킹:네이버영화 20210616기준

# 평점순 랭킹에서 링크 저장 1,2페이지
links = []
for i in range(1,3):
    driver.get(url+str(i))
    ranking = driver.find_elements_by_css_selector('#old_content > table > tbody > tr > td.title > div > a')

    for rank in ranking:
        try:
            link = rank.get_attribute("href")
            links.append(link)
        except NoSuchElementException:
            print("error")
            continue

movie_list = []
for i, link in enumerate(links):
    try:
        driver.get(link)
        elem = driver.find_element_by_css_selector('#content > div.article > div.mv_info_area')
        movie = dict()
        # 영화 고유 아이디
        movie["movie_id"] = i+1

        # 국문제목
        movie["title_kor"] = elem.find_element_by_css_selector('div.mv_info > h3 > a').text

        # 원문제목
        title_year = elem.find_element_by_css_selector("div.mv_info strong").text.split(", ")
        movie["title"] = ','.join(title_year[0:len(title_year)-1])

        # 제작년도
        movie["product_year"] = title_year[len(title_year)-1]

        # 개봉일
        date = ""
        for i, d in enumerate(elem.find_elements_by_css_selector('div.mv_info > dl> dt.step1 + dd > p > span:nth-child(4) > a')) :
            if(i!=1 & i%2==0): date+= ", "
            date += d.text
        movie["open_date"] = date

        #국가
        try:
            movie["country"] = elem.find_element_by_css_selector('div.mv_info > dl > dt.step1 + dd span:nth-child(2)').text
        except NoSuchElementException:
            movie["country"] = ""

        # 장르
        try:
            movie["genre"] = elem.find_element_by_css_selector('div.mv_info > dl > dt.step1 + dd span:nth-child(1)').text
        except NoSuchElementException:
            movie["genre"] = ""

        # 감독
        try:
            movie["director"] = elem.find_element_by_css_selector('div.mv_info > dl > dt.step2 + dd  a').text
        except NoSuchElementException:
            movie["director"] = ""

        #배우
        actor = ""
        for idx, act in enumerate(elem.find_elements_by_css_selector('div.mv_info > dl > dt.step3 + dd a:not(.more)')):
            if(idx==0): actor += act.text
            else: actor += (", "+act.text)

        movie["actor"] = actor

        #줄거리
        story = ""
        try:
            story_elem = driver.find_element_by_class_name('h_tx_story')
            story += (story_elem.text+"\n")
        except NoSuchElementException:
            story += ""
        try:
            story += driver.find_element_by_class_name('con_tx').text
        except NoSuchElementException:
            story += ""

        movie["story"] = story

        # 평점
        movie["vote"] = 0.0

        # 관람 가능 나이
        try:
            movie["age"] = elem.find_element_by_css_selector('div.mv_info > dl > dt.step4 + dd a:nth-child(1)').text
        except NoSuchElementException:
            movie["age"] = ""

        # 상영시간
        try:
            movie["run_time"] = elem.find_element_by_css_selector('div.mv_info > dl > dt.step1 + dd > p > span:nth-child(3)').text
        except NoSuchElementException:
            movie["run_time"] = ""

        #포스터 링크
        try:
            movie["m_poster"] = elem.find_element_by_css_selector('div.poster > a > img').get_attribute('src').split('?')[0]
        except NoSuchElementException:
            movie["m_poster"] = ""

        #movie 추가
        movie_list.append(movie)
        #print(movie)

    # 예외처리 : 예외발생 line, 예외 발생 전 movie 객체 프린트
    except NoSuchElementException:
        _, _ , tb = sys.exc_info()
        print("error : ",tb.tb_lineno, movie)

with open('C:/Users/abcd_/Desktop/final_project/crawler/movie_list.json','w', encoding='utf-8') as make_file:
    json.dump(movie_list,make_file,indent="\t", ensure_ascii=False)
