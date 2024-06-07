## Setup para execução do projeto de testes

O projeto foi feito utilizando Robot Framework 7.0 e a versão 3.12.3 do Python.

Presume-se que o Python esteja instalado na máquina para que seja possível executar os comandos para instalação das dependências, presentes abaixo:

`pip install robotframework robotframework-requests`

Para execução via CLI, utilizar o comando:

`robot  robot -d ./logs .\jsonplaceholder_automation.robot`