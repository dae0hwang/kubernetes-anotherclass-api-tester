# 기본 이미지 사용
FROM openjdk:17
# ./build/libs/app-0.0.1-SNAPSHOT.jar 파일을 컨테이너 내부의 /usr/src/myapp/app.jar 위치에 복사
COPY ./build/libs/app-0.0.1-SNAPSHOT.jar /usr/src/myapp/app.jar
# 컨테이너가 시작될 때 실행할 기본 명령어
# 환경 변수를 설정
# -jar /usr/src/myapp/app.jar: 지정된 app.jar 파일을 실행합니다
ENTRYPOINT ["java", "-Dspring.profiles.active=${spring_profiles_active}", "-Dapplication.role=${application_role}", "-Dpostgresql.filepath=${postgresql_filepath}", "-jar", "/usr/src/myapp/app.jar"]
# 컨테이너가 8080 포트를 외부에 노출
EXPOSE 8080
# 컨테이너 내부에서 /usr/src/myapp을 현재 작업 디렉토리로 설정합니다. 이후의 모든 명령어는 이 디렉토리를 기준으로 실행
WORKDIR /usr/src/myapp