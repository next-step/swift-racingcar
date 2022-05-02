## 자동차 경주 미션 저장소
### Effective Swift
NEXTSTEP with yagom-academy


---
## 목차
1. [자동차 경주 파일 트리](#1-자동차-경주-파일-트리)
2. [구현 기능 목록](#2-구현-기능-목록)
---

## 1. 자동차 경주 파일 트리
```
RacingCar  
├── model  
│   └── Constants.swift  
│   └── Car.swift  
└── view  
├── inputViews  
│   ├── InputError.swift  
│   └── InputView.swift  
└── resultViews  
│   └── ResultView.swift  
├── controller  
│   ├── Game.swift  
│   └── GameOption.swift  
├── main.swift
```


## 2. 구현 기능 목록
- **Constants**
  - `defaultPoint`: 기본 점수
  - `defaultCondition`: 승리 조건
  - `randomRange`: 난수 생성 범위
  - `nameMinLength`: 차 이름 최소 글자 수
  - `nameMaxLength`: 차 이름 최대 글자 수

- **Car**
  - `moveFoward()`: 전진한다


- **InputView**
  - `readCarInfo()`: 경기에 참가할 차의 이름을 입력 받아서 [Car] 리턴
  - `readCount()`: 게임 횟수 입력 받아서 리턴


- **ResultView**
  - `printResult(_:)`: 매회 게임 결과를 출력함
  - `printWinner(_:)`: 게임의 우승자를 출력함


- **Game**
  - `runOnce(_:)`: 라운드에서 한 게임을 진행함
  - `runOneCycle(of:)`: 한 라운드의 게임을 진행함 
  - `run()`: 게임을 진행함


- **GampeOption**
  - `generateRandomNumber()`: 랜덤 숫자를 생성하여 리턴
  - `canGoFoward(_:_:)`: 전진할 수 있는지 체크하여 결과 리턴