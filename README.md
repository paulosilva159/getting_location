# GetX_Getting Location (Português)

Um projeto Flutter usando [GetX Pattern](https://kauemurakami.github.io/getx_pattern/?fbclid=IwAR1ejnKLnVZxJ9Diora2GI0ghEIIeKuvIjpmIUr2-QR1nZ_lf5UgQWzUjt4#home), [Get State Manager](https://pub.dev/packages/get) e [Appwrite](https://appwrite.io/) BAAS. 

## Getting Started

1. **O que o aplicativo faz?**
2. **Usando Obx (RxController)**
3. **Usando GetBuilder (GetController)**
4. **Por que usar GetController?**

### O que o aplicativo faz?

![](demonstration.gif)

O aplicativo retorna uma lista de códigos e nomes de países usando o serviço Appwrite Locale e as gerências de estado de Get (Obx com RxController e GetBuilder com GetController) - A idéia inicial era usar o serviço Appwrite Locale e o package Geolocator para exemplificar o uso de providers no GetX Pattern, mas eu estava tendo problemas com o GPS do emulador. Como o uso do pattern é claro o suficiente neste exemplo, optei por usar apenas o serviço Locale. O usuário também pode filtrar a lista através de um TextField, que responderá com base em qual gerenciador de estado está sendo usado no momento. O aplicativo tem duas páginas Home e Home2 e duas guias cada (uma para códigos de países e outra para nomes de países). O filtro faz distinção entre maiúsculas e minúsculas, logo, se você colocar 'a' e 'A' depois disso, os resultados não serão os mesmos.

### Usando Obx (RxController)

A principal diferença entre Obx (ou GetX) e GetBuilder está no fato de que: GetBuilder (GetController) depende do uso do método update() para alterar o estado do widget, enquanto Obx (RxController) não. Neste exemplo, na primeira página, depois de colocar algo no filtro, a lista será alterada automaticamente para você. Você não precisa fazer mais nada. Em outras palavras, se você quiser algo **reativo**, algo que será "atualizado sozinho", use RxController e Obx (ou GetX). Eu usei a função onChanged no widget TextField para atualizar minhas variáveis de filtro e a lista, logo, no widget ListView.builder, a lista muda automaticamente. 

### Usando GetBuilder (GetController) 

Quando você vai para a segunda página, a lista não se atualiza sozinha, é necessário pressionar o botão update, que possui o método update() do controller. Então, quando você pressiona o botão, a lista muda. Se você escrever algo no TextField, ele não será filtrado sozinho, você deverá pressionar o botão. 

"Espera aí, os dois métodos para atualizar countriesCode e countriesName estão na função onChanged do widget TextField, por que não muda sozinho?" 
Porque se você entrar no HomeController2, verá que o método update() está comentado, para que não funcione. Se você deseja que a segunda tela aja como a primeira, você precisará apenas "descomentar".

### Por que usar GetController?

Nesse cenário, a API Appwrite Locale não me custa nada. Estou livre para usá-la de graça! Mas, se não fosse grátis, eu teria que estar realmente consciente do seu uso. Neste exemplo, consumi mais de mil solicitações usando-o por 5 minutos, porque a função onChanged notifica cegamente qualquer "alteração" - mesmo que eu não escreva nada, ele notifica. Portanto, se 100 solicitações me custarem um dólar, com o GetController, eu teria que pagar apenas um dólar, porque fiz muito menos do que 100 cliques, quando com o RxController eu teria que pagar 10 dólares. Ou seja, GetController e GetBuilder são minha escolha de ouro, porque caso fosse um aplicativo a ser lançado no mercado, obviamente eu consumiria mais de 1000 requisições.

#### P.S.

O GetBuilder e o GetX são muito semelhantes na sintaxe, por isso é válido comparar a sintaxe do GetX e do Obx usando o GetBuilder. Dito isto, optei por usar o Obx em vez do GetX, apenas porque o Obx - nesse caso - possui um código mais limpo do que teria se tivesse escrito com o GetX. Visto que o Obx não ordena que eu use Get.put() ou Get.find() para simplesmente usar um controlador fora do meu widget. Não há nem mesmo binding neste código. **E o que torna este caso, "este caso"?** Eu realmente uso muito meu controlador fora do widget Obx, por isso Obx é a minha escolha.

# GetX_Getting Location (English) 

A Flutter project using [GetX Pattern](https://kauemurakami.github.io/getx_pattern/?fbclid=IwAR1ejnKLnVZxJ9Diora2GI0ghEIIeKuvIjpmIUr2-QR1nZ_lf5UgQWzUjt4#home), [Get State Manager](https://pub.dev/packages/get) and [Appwrite](https://appwrite.io/) BAAS. 

## Getting Started

1. **What the app does?**
2. **Using Obx (RxController)**
3. **Using GetBuilder (GetController)**
4. **Why using GetController?**

### What the app does?

![](demonstration.gif)

The app returns a list of countries codes and names using Appwrite Locale service and both Get state managers (Obx with RxController and GetBuilder with GetController) - The initial idea was to use Appwrite Locale service and Geolocator package to exemplify the GetX Pattern use of Providers, but i was having problem with the emulator's GPS. As the pattern use is clear enough in this example, i've opted to use only Locale. The user can also filter the list through a TextField, which will respond based on which state manager is being used at the moment. It has two pages Home and Home2 and two tabs each (one for countries codes and another for countries names). The filter is case sensitive, so if you put 'a' and 'A' after that, the results with not be the same. 

### Using Obx (RxController)

The major difference between Obx(or GetX) and GetBuilder is in the fact that: GetBuilder(GetController) depends on the use of the update() method to change the widget's state, while Obx(RxController) don't. In this example, in the first page, once you've put something in the filter, the list will automatically change for you. You don't have to do nothing more. In other words, if you want something **reactive**, something that will "update alone", you use RxController and Obx(or GetX). I've used the onChanged function from the TextField widget to update my filter variables and the list, so in the ListView.builder widget, the list changes automatically.

### Using GetBuilder (GetController) 

When you go to the second page, the list will not update itself alone, you have to press the update button, who has the update() method from the controller. So when you press the button, the list will change. If you write something on the TextField, it will not filter itself alone, you have to press the button. 

"But wait, both methods to update countriesCode and countriesName are on the onChanged function of the TextField widget, why it doesn't change alone?" 
Because if you to HomeController2, you will see that the update() method are commented, so they don't work. If you want the second screen to act like the first, you only have to uncomment then.

### Why using GetController?

In this scenario, Appwrite Locale API doesn't cost me anything. I'm free to use it for free! But, if if wasn't, i'd have to be really conscious of its use. In this example, i've consumed more than one thousand requests using it for 5 minutes, because the onChanged function blindly notifies any "change" - even if i write nothing, it notifies. So, if 100 request cost me one dollar, with GetController i'd have to pay only one dollar, because i did way less than 100 clicks, when with RxController i'd have to pay 10 dollars. In other words, GetController and GetBuilder are my golden choice, because if it is an application launched on the market, obviously I will consume more than 1000 requests.

#### P.S.

GetBuilder and GetX are a lot similar in sintax, so it's valid to compare the sintax of GetX and Obx using GetBuilder's. That said, i've opted to use Obx instead of GetX just because Obx - in this case - have i way cleaner code than it would have if i've written it with GetX. Because Obx doesn't order me to use Get.put() or Get.find() to simply use one controller out of my widget. There isn't even binding in this code. **And what makes this case, "this case"?** I really use my controller a lot out of the Obx widget. Because of this, Obx is my choice.  
