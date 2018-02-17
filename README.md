# MySH

MySH est un script permettant à la suite d'une installation d'Ubuntu (ou variantes) d'installer facilement et rapidement :
- un environnement de base 
- un environnement joueur
- un environnement développeur PHP
- Résoudre les problèmes audio (courant sur Lubuntu)
- La suite burautique OpenOffice (si LibreOffice ne vous convient pas)

MySH permet également de lancer une mise à jour complète du système

## Lancer MySH

Dans votre console tapez :

<code>sudo sh [chemain]/MySH.sh</code>

et faites votre choix.

## Installation environnement de base

Lance les mise a jour si vous ne l'avez pas fait au préalable et installe les paquets suivants :

- clamav clamav-daemon : Antivirus Libre
- default-jre default-jdk : Java
- firefox-locale-fr thunderbird-locale-fr : Navigateur et client de messagerie en français

## Installation environnement de joueur

Lance l'installation de l'environement de base si vous ne l'avez pas fait au préalable et installe les paquets suivants :

- playonlinux et steam : Bibliothèque de jeux

## Installation environnement développeur PHP

Lance l'installation de l'environnement de base si vous ne l'avez pas fait au préalable et installe les paquets suivants :

- tasksel : Bibliothèque de serveurs (pour installer LAMP)
- netbeans : IDE
- git : Verssioning
- fail2ban : sécurité
- phpmyadmin : Administration de MySQL

Lors de l'installation tasksel et phpmyadmin vous demanderont des détails ds configuration,
sélectionnez "LAMP Setver", "Apache" et saisissez les mots de passe qui sécuriseront votre base MySQL