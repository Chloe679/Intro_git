1. Récupérer l'archive suivante https://www.outofpluto.com/media/uploads/formation/shell/intro-shell.zip

```sh
wget https://www.outofpluto.com/media/uploads/formation/shell/intro-shell.zip
```

2. Désarchiver le fichier

```sh
unzip intro-shell.zip
```

3. Changer de répertoire pour le répertoire désarchivé

```sh
cd intro-shell
```

4. Concaténer tous les fichiers . txt dans all. txt

```sh
find . -type f -name "\*.txt" > all.txt
```

5. Afficher le nom de tous les fichiers qui contiennent le mot Hello

```sh
grep -rl "Hello" .
```

6. Afficher le nombre de fichiers contenant le mot Hello

```sh
grep -rl "Hello" | wc -l
```

7. Afficher le résultat de la commande python credits sans fichier

```sh
python3 -c "print(credits)"
```

8. Trouver le nombre total de lignes de code dans tous les .py d'un répertoire (sans compter les lignes vides)

```sh
grep -r --include="_.py" -v "^\s_$" . | wc -l # selectionne toutes les lignes sauf celles matchant le regex
```

9. Afficher toutes les lignes d'un fichier qui apparaissent en double

```sh
awk 'n[$0]++ == 1' data.csv # dictionnaire n associant chaque ligne à un chiffre qui s'incrémente
```

10. Afficher uniquement les permissions et noms des fichiers d'un dossier

```sh
ls -l | awk '{print $1, $9}' # cellule 1 et 9 de chaque ligne, permissions et nom
```

11. Afficher le chemin absolu des 10 fichiers les plus gros dans un dossier et ses sous-dossiers

```sh
find [chemin absolu dossier] -type f -exec du -b {} + | sort -rn | head -n 10 # $(pwd) pour chemin absolu dans le find, puis on tri par taille, puis on select les 10 premiers
```

> ℹ️ il faut être dans le dossier dans lequel on fait la recherche

12. Afficher les lignes communes à deux fichiers

```sh
grep -Fx -f [fichier 1] [fichier 2]
```

13. Afficher tous les fichiers exécutables dans le répertoire courant

```sh
find . -maxdepth 1 -type f -executable
```

14. Compter combien de fichiers sont vides dans un dossier et ses sous-dossiers

```sh
find [dossier] -type f -empty | wc -l
```

15. Lister tous les fichiers qui ont été modifiés dans les 24 dernières heures

```sh
find . -type f -mtime -1 # date de modification maximum = -1 jours
```
