#! /usr/bin/env python3
import os, sys

# On récupère toutes les lignes
lignes = {}
for fichier in os.listdir("textes"):
    print(fichier)
    with open(os.path.join("textes", fichier)) as f:
        for l in f.readlines():
            if l in lignes:
                lignes[l] += 1
            else:
                lignes[l] = 1
# On supprime les lignes inutiles
# Les nouveaux fichiers sont écrits dans le répertoire textes_propres
# Si ce répertoire n'existe pas, on le crée
if not os.path.exists("textes_propres"):
    os.mkdir("textes_propres")
for fichier in os.listdir("textes"):
    print("Suppression dans %s" % fichier)
    with open(os.path.join("textes", fichier)) as f:
        gardees = [] # On crée une liste des lignes conservées
        for l in f.readlines():
            if not lignes[l] > 800:
                gardees.append(l)
        with open(os.path.join("textes_propres", fichier), "w") as fw:
            fw.writelines(gardees) # On écrit les lignes conservées dans un nouveau fichier
