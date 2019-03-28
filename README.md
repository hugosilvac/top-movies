# Top Movies

	O aplicativo Top Movies é um app desenvolvido em swift. 
	Possui como intenção mostrar os filmes mais populares para o usuário.
	O usuário adicionar os filmes como favoritos para não esquecer de assistir.
	Para iniciar a aplicação é necessário entrar no terminar ir ao diretório do projeto e digitar o comando: 

		pod install
---

## Desenvolvimento

	O projeto foi feito em MVVM e foi divido em algumas camadas.
	Cada uma com sua responsabilidade e com a função de deixar o projeto desacoplado. 
	As camadas são : App, Business , Network e Persistence

---

### App
	
	Nessa camada esta a parte de configuração básica do app.
	 - UIViewController;
	 - UIViewModel
	 - Storyboard
	 - Celulas 
	 - Views 

### Business
	
	Camada responsável pelas rotas (se vai para a camada Percistence ou Network), Mappers.

### Network

	Responsável por fazer a comunicação da aplicação com a Api.

### Percistence

	Responsável por salvar os filmes favoritos no próprio dispositivo.
