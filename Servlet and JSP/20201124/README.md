# 오늘 해볼 것
1. 서버 띄우고
2. 도메인 연결(DNS)
3. HTTPS 적용

# 1. 서버 띄우기
클라우드 서비스 사용하여 서버 띄우기
https://www.vultr.com/

클라우드 서비스
- AWS(아마존)
- GCP(구글)
- Azure(아마존)
- vultr
- digital ocean

# 2. 도메인
1. 주소창에 도메인(https://google.com) 입력
2. 로컬(자신의 컴퓨터) 머신에 등록된 DNS에게 해당 도메인 질의(query)
   1. 해당 DNS에 캐싱되어 있으면 바로 응답
   2. 없으면 상위 네임 서버에 물어봄
3. 응답받은 IP 주소로 통신(TCP/IP)

# 명령어
1. 프로세스 목록
- ps -aux
2. 프로세스 목록에서 원하는 프로그램(ex. 자바 찾기)
- ps -aux | grep java
3. 프로세스 죽이기
- kill -9 pid
4. 백그라운드로 프로세스 실행
- nohup <실행할 명령 라인> &
- nohup java -jar app.jar &
