# `INF2610 LAB ENV`

Par Philippe Rivest

![INF2610 F1 Team](cover.jpg "INF2610 F1 Team")

## Pourquoi?

À moins que vous soyez à la fine pointe de la technologie et vous utilisez une distribution GNU/Linux [à tous les jours](https://youtu.be/-OHiEzz8oBw?t=132), il est impossible de compiler et d'exécuter les laboratoires de INF2610 sur Windows ou macOS.

Le répertoire suivant énumère les étapes pour y arriver et ce peu importe la plateforme.

## Comment?

![Docker](https://klauslaube.com.br/images/blog/docker-logo-2.png "Docker") 

**Docker** est votre meilleur ami! Il vous permet d'utiliser des outils dans des conteneurs. Nous allons créer un conteneur équivalent aux laboratoires Fedora de Polytechnique. Téléchargez Docker et suivez le _Getting Started_ pour être certain que tout fonctionne.

### Téléchargement

**macOS**: [https://hub.docker.com/editions/community/docker-ce-desktop-mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

**Windows**: [https://docs.docker.com/toolbox/toolbox_install_windows/](https://docs.docker.com/toolbox/toolbox_install_windows/)

> Pour les puristes qui me disent que Docker Toolbox est deprecated, je le sais très bien. Par contre, pour avoir déjà aidé à installer *Docker Desktop*, il est mieux de partir avec ça et ils penseront à leur [choix de système d'exploitation.](https://youtu.be/-OHiEzz8oBw?t=132)

### Création de l'image Docker

1) Clonez le dépôt

```bash
git clone https://github.com/technophil98/INF2610-lab-env.git
cd INF2610-lab-env
```

2) Créez l'image (~5 minutes)

```bash
docker build -t inf2610-lab-env .
```

L'étape 2 va créer un environnement _Fedora 28_ avec tous les outils pour compiler et exécuter les laboratoires.

### Créer un conteneur

La dernière étape tient en une ligne _(ok, peut-être deux)_:

```bash
cd LE_DOSSIER_DE_MON_LAB
docker run -it --rm --cap-add SYS_PTRACE -v "$(pwd):/lab" inf2610-lab-env
```

Vous êtes maintenant à l'intérieur d'un conteneur Docker comme si vous étiez en ligne de commande dans le laboratoire.

### Compiler et exécuter le laboratoire

```bash
cd lab #les fichiers de laboratoire sont dans le dossier /lab
make
./grade.sh
```

### Modifier les fichiers de code

Puisque Docker utilise **directement** les fichiers présents sur votre ordinateur, vous pouvez les modifier avec votre éditeur de texte favori (comme [VSCodium](https://github.com/VSCodium/vscodium), une version open source de VSCode).

## Qui?

**[Moi!](https://github.com/technophil98)** Vous avez des problèmes? Envoyez-moi un message.
