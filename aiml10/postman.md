# <a name="using-postman"></a>Postman 사용
모든 데모에서 연습을 수행하는 데 필요한 세 가지 개념이 있습니다.

1. 컬렉션 가져오기
2. 컬렉션 변수 설정
3. 사전 요청 스크립트를 사용하여 변수 설정

## <a name="what-you-need"></a>필요한 항목
데모 전체에서 사용되는 세 가지 컬렉션이 있습니다.
1. [Form Recognizer API](src/Collections/Form_Recognizer.postman_collection.json)
2. [판독기 기술 API 호출](src/Collections/Reader_Skill.postman_collection.json)
3. [청구서 검색 API 호출](src/Collections/Invoice_Search.postman_collection.json)

## <a name="importing-a-collection"></a>컬렉션 가져오기

1. 적절한 컬렉션을 다운로드합니다(위 참조).
2. Postman 열기
3. 가져오기 클릭

![컬렉션 가져오기](images/import_collection.png "컬렉션 가져오기")

4. 적절한 컬렉션을 선택합니다.

![컬렉션 가져오기](images/import_collection_file.png "컬렉션 가져오기")

## <a name="modifying-collection-variables"></a>컬렉션 변수 수정

컬렉션 변수를 사용하면 Postman이 `{variable}`과 같은 토큰을 사용자가 설정한 값으로 바꿀 수 있습니다. 이렇게 하면 변수에 대한 변경으로 요청의 이식성이 높아집니다. 예를 들어 일부 연습의 `endpoint` 변수는 특정 Form Recognizer 서비스에 대한 엔드포인트를 나타냅니다. 

1. 컬렉션이 로드된 후에는 줄임표를 클릭하여 컬렉션 변수를 편집합니다.

![변수 편집](images/edit_variables.png "변수 편집")

2. 권한 부여 변수를 편집하려면 권한 부여 탭을 사용합니다.

![권한 부여 편집](images/edit_authorization.png "권한 부여 편집")

3. 이러한 연습에서 사용되는 다른 모든 변수는 변수 탭에 있습니다.

![변수 편집](images/variables_tab.png "변수 편집")

## <a name="using-pre-request-scripts"></a>사전 요청 스크립트 사용

일부 연습에서는 사전 요청 스크립트를 변경해야 합니다. 이러한 스크립트는 아래와 같이 개별 요청의 사전 요청 스크립트 섹션에서 액세스할 수 있습니다.

![사전 요청 스크립트](images/pre_request.png "사전 요청 스크립트")

