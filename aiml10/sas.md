# <a name="shared-access-signatures"></a>공유 액세스 서명

몇 가지 데모에서는 Azure Storage 계정의 BLOB에 액세스하기 위해 [공유 액세스 서명](https://docs.microsoft.com/en-us/azure/storage/common/storage-sas-overview?WT.mc_id=msignitethetour2019-github-aiml10)을 사용해야 합니다. Azure Search가 인덱싱할 BLOB에 대한 임시 액세스 권한을 부여하는 데 사용됩니다. 여기서 이 작업을 수행하는 방법을 설명합니다.

## <a name="using-the-portal"></a>포털 사용

1. 스토리지 BLOB 컨테이너로 이동하여 원하는 컨테이너를 마우스 오른쪽 단추로 클릭하고 `Get Shared Access Signature`를 선택합니다.

![공유 액세스 서명 가져오기](images/sas_portal.png "공유 액세스 서명 가져오기")

2. 서명에 대한 적절한 시작 시간 및 만료 시간을 선택합니다. 이러한 연습에서는 `Read` 및 `List` 권한을 선택해야 합니다(아래로 스크롤하여 `List` 확인란 찾기).

![SAS 설정](images/sas_portal_step1.png "SAS 설정")

3. 아래와 같이 쿼리 문자열을 복사합니다. 

![SAS 서명](images/sas_portal_step2.png "SAS 서명")

## <a name="using-microsoft-azure-storage-explorer"></a>Microsoft Azure Storage Explorer 사용

1. [Microsoft Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/?WT.mc_id=msignitethetour2019-github-aiml10)를 다운로드하고 설치합니다.

2. 스토리지 BLOB 컨테이너로 이동하여 원하는 컨테이너를 마우스 오른쪽 단추로 클릭하고 `Get Shared Access Signature`를 선택합니다.

![공유 액세스 서명 가져오기](images/sas_explorer.png "공유 액세스 서명 가져오기")

3. 서명에 대한 적절한 시작 시간 및 만료 시간을 선택합니다. 이러한 연습에서는 `Read` 및 `List` 권한을 선택해야 합니다(아래로 스크롤하여 `List` 확인란 찾기).

![SAS 설정](images/sas_explorer_step1.png "SAS 설정")

4. 아래와 같이 쿼리 문자열을 복사합니다. 

![SAS 서명](images/sas_explorer_step2.png "SAS 서명")