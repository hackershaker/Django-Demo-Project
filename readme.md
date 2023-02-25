# Django Demo Project
- environment : Docker
- reference : https://docs.djangoproject.com/

### 시행착오 정리
- postgresql접속 시 postgres 아이디로 전환(sudo su - postgres)
- ubuntu, debian 등 일부 linux에서는 pg_ctlcluster 명령어를 이용해 서비스 시작
- WSL에서 보안 관련 이유로 systemctl이 안 돼서 pg_ctlcluster 사용
- 운영체제 내 다른 postgresql 버전을 사용하고 있을 수 있기 때문에 pg_ctlcluster를 사용해야 한다고 함.(https://csupreme19.github.io/db/postgresql/2021/08/06/postgresql-pg_ctlcluster.html)