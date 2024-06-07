*** Settings ***
Documentation    Arquivo contendo as keywords utilizadas nos cenários de teste
Library    RequestsLibrary
Library    Collections    

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com
&{HEADERS}    Content-Type=application/json; charset=UTF-8   
${STATUS_CODE}    None

*** Keywords ***    
O usuário possua uma sessão criada para a API
    Create Session    jsonplaceholder_session    ${BASE_URL}

Efetuar uma requisição "${VERB}" com o parametro "${PATH_PARAM}" e com o corpo "${BODY}"
    IF    "${VERB}" == 'GET'
        IF    "${PATH_PARAM}" is None
            ${response}    GET On Session    jsonplaceholder_session    /posts
            Set Test Variable    ${ITERATION_RESPONSE}    ${response.json()}
        ELSE
            ${response}    GET On Session    jsonplaceholder_session    /posts/${PATH_PARAM}      
            Set Test Variable    ${ITERATION_RESPONSE}    ${response.json()}
        END
    END

    IF    "${VERB}" == 'POST'
        ${response}    POST On Session    jsonplaceholder_session    /posts    ${BODY}    headers=${HEADERS}
        Set Test Variable    ${ITERATION_RESPONSE}    ${response.json()}
    END

    IF    "${VERB}" == 'PUT'
        ${response}    PUT On Session    jsonplaceholder_session    /posts/${PATH_PARAM}    ${BODY}    headers=&{HEADERS}
        Set Test Variable    ${ITERATION_RESPONSE}    ${response.json()}
    END

    IF    "${VERB}" == 'DELETE'
        ${response}    DELETE On Session    jsonplaceholder_session    /posts/${PATH_PARAM}    headers=${HEADERS}
        Set Test Variable    ${ITERATION_RESPONSE}    ${response.json()}     
    END

Receberá um status code "${RESPONSE_STATUS_CODE}"
    Status Should Be    ${RESPONSE_STATUS_CODE}

A lista de retorno conterá "${NUMBER_OF_ELEMENTS}" elementos
    Log    ${ITERATION_RESPONSE}
    Count Values In List    ${ITERATION_RESPONSE}    ${NUMBER_OF_ELEMENTS}

O corpo da response conterá o campo "${FIELD_NAME_AND_VALUE}"
    ${STRING_RESPOSNE}=    Convert To String    ${ITERATION_RESPONSE}
    Should Contain    ${STRING_RESPOSNE}    ${FIELD_NAME_AND_VALUE}