Proje Hakkında

Projede kullanılan  paketler:

provider: State management için provider yapısını kullandım.\
get_it: Dependency injection için bu paketi kullandım.\
dartz:Fonksiyonel programlama için dartz kullandım. Bu pakette Either yapısından yararlandım.<br />
http: Servis isteklerini bu paketi kullanarak yaptım.

Proje Özeti

Proje data, domain ve presentation katmanlarından oluşuyor. Presentation katmanında state management ve UI ksımlarını kodladım.  Data katmanında, model classlar, repositorylerin implementasyonları, ve datasourcelar bulunuyor. Servis isteklerini buradan gönderiyorum ve json formatındaki verileri burada modellerime çeviriyorum. Repository kısmında eğer herhangi bir hata ile karşılaşılırsa dartz paketinin sağladığı Left classının içerisinde hata modelimi döndürüyorum, eğer beklediğim response gelirse, Right classı içerinde modelimi döndürüyorum. Bu katmanda herhangi bir hata yakaladığım  zaman, buradan döndürdüğüm için, presentation katmanında bu kontrolleri yapmam gerekmiyor. Bu şekilde tamamen birbirinden bağımsız hale gelmiş oluyorlar.  \

Projenin domain katmanında ise entityler, usecaseler ve repository abstract classlar bulunuyor. Model classlar, buradaki entitylerden inherit alıyor. Projede abstract yapısını kullandığım zaman herhangi bir şey değiştirdiğimde  syntax hatasına düştüğü için, ilgili kısımları değiştirmeyi unutmanın pek imkanı olmuyor. Usecaseler ise, projenin presentation katmanında çağırmış olduğum classlar oluyor. Örneğin projede GetShortenedLink adında bir usecase var, dependencyleri başlangıçta inject ettikten sonra ilgili kısımda Usecase'i çağırıyorum ve usecase repository'e bağlı, repository datasourcedan dönen veriyi getiriyor(Failure veya success). Usecase'de bana oradan dönen veriyi dönüyor. Sonrasında, usecaseden gelen veriye göre state güncellemesi yapıyorum. 
```
   Future<Either<Failure, ShortenedLink>> call(params) async {
    return await repository.getShortenedLink(params.link);
  }
```

Vektörü çizebilmek için, ipucunu üzerine, Custom Paint kullandım. Burada 4 nokta için cubicTo kullandım. 

