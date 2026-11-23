# [PT-BR] Versão Brasileira (Gold / Silver / Crystal)

Porte da tradução PT-BR dos jogos *Pokémon Gold*, *Pokémon Silver* e *Pokémon Crystal*, feitos pelo antigo grupo Tradu-Roms, para o formato de **mod para o gen1recomp**.

Em se tratando de traduções para os jogos de Pokémon Gold/Silver/Crystal (GSC), as melhores traduções tem sido as do grupo Tradu-Roms, feitas entre 2001~2005 pelos membros R_Lopes, Night_Shadown e fserve. Foram traduções que seguiram bastante à risca o anime de Pokémon que passava na época, adotando sua mesma terminologia e contando com diversas revisões até 2005. É uma tradução relativamente sólida para a sua época, mesmo estando defasada com relação às terminologias mais atuais.

Com o passar dos anos, o grupo Tradu-Roms se desfez, porém um dos membros antigos do grupo, o fserve, agora faz parte do grupo [Elite dos Quatro Traduções](https://e4t.com.br/), que tem traduzido jogos mais recentes da série e mantendo as mesmas terminologias oficiais. Sempre tem havido o desejo de revisitar as traduções antigas de Pokémon GSC, então o fserve nos concedeu permissão para atualizar as traduções antigas, desde que creditando todos os envolvidos no processo.

Assim surgiu esse projeto. A ideia é fazer uso pleno do [gen1recomp](https://github.com/bryanthaboi/gen1recomp), que possibilita implementar vários aprimoramentos de QoL no jogo original, principalmente a fonte [Fusion Pixel](https://github.com/TakWolf/fusion-pixel-font), de largura variável, o que nos permitirá desabreviar um monte de coisas e também resultará e diálogos bem mais dinâmicos e com menos pausas. Também contará com gráficos expandidos, podendo aumentar eles se necessário.

Na parte textual, optei por usar IA para inicialmente extrair todos os textos da fã-tradução do Pokémon Crystal para um arquivo .txt, e em seguida portá-los para uma mod de tradução do gen1recomp. Isso resultou em cerca de 80% dos textos portados, e os 20% restante terá de ser retraduzido do zero. E também será preciso fazer uma revisão completa nos scripts para fazerem o devido uso da fonte nova, o que será possível de ser feito com a ferramenta [game-dialog-previewer](https://github.com/leomontenegro6/game-dialog-previewer) que desenvolvi para este fim.

Os arquivos foram subidos para o repositório pra fazer uso de versionamento e evitar perda de trabalho. A ideia será fazer o porte/retradução/revisão aos poucos e seguir commitando correções sempre que determinados marcos forem atingidos. Está marcado como WIP (Work in Progress), mas será atualizado no futuro.

## Créditos

- **Tradu-Roms**: Tradução original de GSE para GBC, lançada no começo dos anos 2000 por R_Lopes, Night_Shadown e fserve;
- **Elite dos Quatro Traduções**: Atualização da terminologia da tradução, e retradução de diversas partes do jogo;
- **Solid One**: Criação do mod, port dos textos, e revisão.

## Instalação

Coloque a pasta em:

```
%APPDATA%\pokemon-love2d\mods\gen2_gsc_pt-br_mod\
```

e abra o jogo. O mod é carregado por padrão (não é experimental). Gold, Silver ou Crystal precisam estar importados no launcher.