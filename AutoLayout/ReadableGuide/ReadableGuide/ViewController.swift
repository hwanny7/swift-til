//
//  ViewController.swift
//  ReadableGuide
//
//  Created by yun on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {

        let label = makeLabel(withText: "현재의 공직 문화가 새만금 잼버리와 같은 장기 프로젝트를 일관성 있게 준비하기엔 역부족이라는 탄식도 내부에서 나온다. 잼버리 유치가 결정된 2017년 8월 이후 여가부는 장관이 4번 바뀌었다. 정현백(2017년 7월 7일~2018년 9월 20일), 진선미(2018년 9월 21일~2019년 9월 8일), 이정옥(2019년 9월 9일~2020년 12월 28일), 정영애(2020년 12월 29일~2022년 5월 16일)에 이어 현재 김현숙 장관으로 이어진다. 차관은 이숙진·김희경·김경선 차관에서 현 이기순 차관까지 4명이었고, 같은 기간 ‘2023 새만금 세계스카우트잼버리 지원 특별법’ 담당 부서인 청소년활동진흥과장은 4명, 국장급인 청소년정책관은 6명이 거쳐 갔다. 청소년정책관은 이번 대회의 지원단장을 겸하는 자리다. 한 공무원은 “잦은 인사로 굵직한 행사를 꾸준히 이끌 사람이 없었다는 게 문제”라고 말했다. 직장인 앱 블라인드에는 “행사가 8월 초라 인사가 나고 담당자가 중간에 바뀌면 그만”이라는 현직 공무원의 글이 올라왔다.")
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }
    
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // important!
        label.backgroundColor = .yellow
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = text

        return label
    }


}

