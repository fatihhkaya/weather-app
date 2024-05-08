# SWIFTUI HAVA DURUMU UYGULAMASI </br>
Bu uygulama, kullanıcıların gerçek zamanlı hava durumu verilerini görüntülemelerine ve favori konumlarını kaydetmelerine olanak tanır. Uygulama, kullanıcının konumunu belirlemek için CoreLocation framework'ünü ve hava durumu verilerini almak için OpenWeatherMap API'sını kullanır.

## Özellikler </br>
Gerçek zamanlı hava durumu bilgilerini görüntüleme
Kullanıcının konumunu belirleme
Favori konumları ekleme ve kaldırma
Arama yaparak belirli bir konumun hava durumunu görüntüleme
### Kullanılan Teknolojiler ve Frameworkler

CoreLocation: Kullanıcının konumunu belirlemek için CoreLocation framework'ü kullanılmıştır. </br>
Combine: Reactive programlama paradigması için Combine framework'ü kullanılmıştır. </br>
URLSession: Hava durumu verilerini almak için URLSession kullanılmıştır. </br>
FileManager: Favori konumları kalıcı olarak depolamak için FileManager kullanılmıştır. </br>

### Kod Yapısı
1. WeatherService.swift
Bu dosya, OpenWeatherMap API'sından hava durumu verilerini almaktan sorumludur. getCurrentWeather fonksiyonu, belirli bir enlem ve boylam koordinatına göre hava durumu verilerini alır.

2. LocationManager.swift
Bu dosya, kullanıcının konumunu belirlemekten sorumludur. CoreLocation framework'ünü kullanarak kullanıcının konumunu izler ve güncellemeler alır.

3. DataStore.swift
Bu dosya, favori konumları depolamak ve yönetmek için kullanılır. Favori konumlar, FileManager kullanılarak kalıcı olarak depolanır.

4. HomeViewModel.swift
Bu dosya, ana görünümün mantığını içerir. Kullanıcının konumunu ve hava durumu verilerini alır, favori konumları yönetir ve görünümleri güncellemekten sorumludur.

5. FavoriteAddViewModel.swift
Bu dosya, favori konumları ekleme ve kaldırma işlemlerini yönetir.

6. Görünüm Dosyaları (SwiftUI)
Uygulamanın kullanıcı arayüzü, SwiftUI görünümleri kullanılarak oluşturulmuştur. Ana görünümler HomeView, FavoriteLocView ve FavLocationAddView'dır.

Ekran Görüntüleri

<img src= "https://github.com/fatihhkaya/bulutsystem/assets/53151395/3fd0849e-5daa-4586-b663-961c9150957c" width = 300 />
<img src= "https://github.com/fatihhkaya/bulutsystem/assets/53151395/32a06798-36d2-47d7-a2d2-2aef28dac851" width = 300 />
<img src= "https://github.com/fatihhkaya/bulutsystem/assets/53151395/2c802d7c-1066-45a2-826c-1abb4ba65517" width = 300 />

<img src= "https://github.com/fatihhkaya/bulutsystem/assets/53151395/17d36df0-2421-4e7c-9197-fa401329c682" width = 300 />
