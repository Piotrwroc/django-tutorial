
# Dokumentacja Projektu: Wdrożenie Produkcyjne Aplikacji Django

# 1. Cel Projektu
Celem projektu jest automatyzacja wdrażania gotowej aplikacji do warunków produkcyjnych. W ramach prac zastąpiono domyślne narzędzia deweloperskie rozwiązaniami o charakterze produkcyjnym, co zapewnia zgodność z dobrymi praktykami inżynierii oprogramowania oraz gotowość systemu do wdrożenia w architekturze chmurowej.

# 2. Zakres Zrealizowanych Prac
* **Migracja warstwy bazy danych:** 
  Zastąpiono lokalną bazę danych SQLite systemem **PostgreSQL**, zapewniając stabilność oraz skalowalność przechowywanych danych.
* **Konteneryzacja środowiska:** 
  Aplikacja została zamknięta w kontenerze Docker przy użyciu serwera produkcyjnego Gunicorn, co uniezależnia system od specyfiki lokalnego środowiska operacyjnego.
* **Automatyzacja procesów CI/CD:** 
  Skonfigurowano potok automatyzacji przy użyciu GitHub Actions, realizujący proces budowania oraz publikacji obrazów aplikacji w rejestrze GitHub Container Registry (GHCR) po każdej modyfikacji kodu źródłowego.

# 3. Schemat Działania Potoku Wdrożeniowego (CI/CD)

Poniższy diagram przedstawia przepływ procesu integracji i ciągłego wdrażania oprogramowania:

[ Środowisko Lokalne (Kod źródłowy) ] -> (Zatwierdzenie i wysłanie zmian - Git Push)[ Repozytorium Zdalne (GitHub) ] -> (Automatyczne wyzwolenie potoku) -> 
[ GitHub Actions (Budowanie obrazu Dockera) ] -> (Zakończenie procesu sukcesem)[ Rejestr Artefaktów (GitHub Container Registry) ]

# 4. Podsumowanie
Wdrożone zmiany eliminują zależność systemu od narzędzi deweloperskich, zapewniają stabilne środowisko uruchomieniowe dzięki konteneryzacji oraz automatyzują proces dystrybucji oprogramowania za pomocą w zintegrowanego potoku CI/CD.
