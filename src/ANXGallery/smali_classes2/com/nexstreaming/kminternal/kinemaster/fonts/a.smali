.class Lcom/nexstreaming/kminternal/kinemaster/fonts/a;
.super Ljava/lang/Object;
.source "BuiltInFonts.java"


# direct methods
.method private static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_0
    if-ge v4, v1, :cond_4

    aget-char v6, p0, v4

    if-eqz v5, :cond_1

    const/16 v5, 0x61

    if-lt v6, v5, :cond_0

    const/16 v5, 0x7a

    if-gt v6, v5, :cond_0

    add-int/lit8 v6, v6, -0x20

    int-to-char v6, v6

    :cond_0
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const/4 v5, 0x0

    goto :goto_2

    :cond_1
    const/16 v7, 0x5f

    if-eq v6, v7, :cond_3

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    :cond_3
    :goto_1
    const/16 v5, 0x20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const/4 v5, 0x1

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static a()Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/16 v1, 0x10

    new-array v1, v1, [Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v3, "system.robotothin"

    const-string v4, "android"

    const-string v5, "sans-serif-thin"

    const/4 v6, 0x0

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    const-string v7, "Roboto Thin"

    invoke-direct {v2, v3, v4, v5, v7}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v6

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v3, "system.robotolight"

    const-string v4, "android"

    const-string v5, "sans-serif-light"

    invoke-static {v5, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    const-string v7, "Roboto Light"

    invoke-direct {v2, v3, v4, v5, v7}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v4, "system.droidsans"

    const-string v5, "android"

    const-string v7, "sans-serif"

    invoke-static {v7, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v7

    const-string v8, "Roboto Regular"

    invoke-direct {v2, v4, v5, v7, v8}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v4, 0x2

    aput-object v2, v1, v4

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v5, "system.droidsansb"

    const-string v7, "android"

    const-string v8, "sans-serif"

    invoke-static {v8, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v8

    const-string v9, "Roboto Bold"

    invoke-direct {v2, v5, v7, v8, v9}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v5, 0x3

    aput-object v2, v1, v5

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v7, "system.robotonthini"

    const-string v8, "android"

    const-string v9, "sans-serif-thin"

    invoke-static {v9, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    const-string v10, "Roboto Thin Italic"

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v7, 0x4

    aput-object v2, v1, v7

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotolighti"

    const-string v9, "android"

    const-string v10, "sans-serif-light"

    invoke-static {v10, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Light Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v8, 0x5

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotoi"

    const-string v9, "android"

    const-string v10, "sans-serif"

    invoke-static {v10, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Regular Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v8, 0x6

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotobi"

    const-string v9, "android"

    const-string v10, "sans-serif"

    invoke-static {v10, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Bold Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/4 v8, 0x7

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotocond"

    const-string v9, "android"

    const-string v10, "sans-serif-condensed"

    invoke-static {v10, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Condensed Regular"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0x8

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotocondi"

    const-string v9, "android"

    const-string v10, "sans-serif-condensed"

    invoke-static {v10, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Condensed Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0x9

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotocondb"

    const-string v9, "android"

    const-string v10, "sans-serif-condensed"

    invoke-static {v10, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Condensed Bold"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xa

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.robotocondbi"

    const-string v9, "android"

    const-string v10, "sans-serif-condensed"

    invoke-static {v10, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Roboto Condensed Bold Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xb

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.droidserif"

    const-string v9, "android"

    sget-object v10, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v10, v6}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Noto Serif Regular"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xc

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.droidserifb"

    const-string v9, "android"

    sget-object v10, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v10, v3}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Noto Serif Bold"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xd

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.droidserifi"

    const-string v9, "android"

    sget-object v10, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v10, v4}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Noto Serif Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xe

    aput-object v2, v1, v8

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v8, "system.droidserifbi"

    const-string v9, "android"

    sget-object v10, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-static {v10, v5}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v10

    const-string v11, "Noto Serif Bold Italic"

    invoke-direct {v2, v8, v9, v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    const/16 v8, 0xf

    aput-object v2, v1, v8

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v8, 0x0

    :goto_0
    if-ge v8, v2, :cond_11

    aget-object v9, v1, v8

    const-string v10, ".ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_10

    const-string v10, "bevan.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_0

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.bevan"

    const-string v11, "latin"

    const-string v12, "bevan.ttf"

    const-string v13, "Bevan"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_0
    const-string v10, "creepster-regular.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_1

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.creepster"

    const-string v11, "latin"

    const-string v12, "creepster-regular.ttf"

    const-string v13, "Creepster"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_1
    const-string v10, "goudy_stm_italic.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_2

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.sortsmillgoudyital"

    const-string v11, "latin"

    const-string v12, "goudy_stm_italic.ttf"

    const-string v13, "Sorts Mill Goudy Italic"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_2
    const-string v10, "greatvibes-regular.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_3

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.greatvibes"

    const-string v11, "latin"

    const-string v12, "greatvibes-regular.ttf"

    const-string v13, "Great Vibes"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_3
    const-string v10, "junction.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_4

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.junction"

    const-string v11, "latin"

    const-string v12, "junction.ttf"

    const-string v13, "Junction"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_4
    const-string v10, "knewave.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_5

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.knewave"

    const-string v11, "latin"

    const-string v12, "knewave.ttf"

    const-string v13, "Knewave"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_5
    const-string v10, "lato-bold.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_6

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.latobold"

    const-string v11, "latin"

    const-string v12, "lato-bold.ttf"

    const-string v13, "Lato Bold"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_6
    const-string v10, "leaguegothic.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_7

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.leaguegothic"

    const-string v11, "latin"

    const-string v12, "leaguegothic.ttf"

    const-string v13, "League Gothic"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_7
    const-string v10, "leaguescript.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_8

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.leaguescriptthin"

    const-string v11, "latin"

    const-string v12, "leaguescript.ttf"

    const-string v13, "League Script"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_8
    const-string v10, "lindenhill.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_9

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.lindenhillregular"

    const-string v11, "latin"

    const-string v12, "lindenhill.ttf"

    const-string v13, "Linden Hill"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_9
    const-string v10, "orbitron-bold.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_a

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.orbitronbold"

    const-string v11, "latin"

    const-string v12, "orbitron-bold.ttf"

    const-string v13, "Orbitron Bold"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_a
    const-string v10, "orbitron-medium.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_b

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.orbitronmedium"

    const-string v11, "latin"

    const-string v12, "orbitron-medium.ttf"

    const-string v13, "Orbitron Medium"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    :cond_b
    const-string v10, "raleway_thin.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_c

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.ralewaythin"

    const-string v11, "latin"

    const-string v12, "raleway_thin.ttf"

    const-string v13, "Raleway Thin"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_c
    const-string v10, "redressed.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_d

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.redressedregular"

    const-string v11, "latin"

    const-string v12, "redressed.ttf"

    const-string v13, "Redressed"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_d
    const-string v10, "sniglet.ttf"

    invoke-virtual {v9, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_e

    new-instance v9, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v10, "builtin.font.sniglet"

    const-string v11, "latin"

    const-string v12, "sniglet.ttf"

    const-string v13, "Sniglet"

    invoke-direct {v9, v10, v11, v12, v13}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_e
    const-string v10, "_H_"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_f

    goto :goto_1

    :cond_f
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    sub-int/2addr v10, v7

    invoke-virtual {v9, v6, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "builtin.font."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/a;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v13, "latin"

    invoke-static {v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v11, v12, v13, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_10
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    :cond_11
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_12

    new-array v1, v7, [Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v7, "system.robotomed"

    const-string v8, "android"

    const-string v9, "sans-serif-medium"

    invoke-static {v9, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    const-string v10, "Roboto Medium"

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v6

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v7, "system.robotomedi"

    const-string v8, "android"

    const-string v9, "sans-serif-medium"

    invoke-static {v9, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    const-string v10, "Roboto Medium Italic"

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v3

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v7, "system.robotoblk"

    const-string v8, "android"

    const-string v9, "sans-serif-black"

    invoke-static {v9, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    const-string v10, "Roboto Black"

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v4

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v7, "system.robotoblki"

    const-string v8, "android"

    const-string v9, "sans-serif-black"

    invoke-static {v9, v4}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v9

    const-string v10, "Roboto Black Italic"

    invoke-direct {v2, v7, v8, v9, v10}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v5

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-array v1, v5, [Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v5, "system.cursive"

    const-string v7, "android"

    const-string v8, "cursive"

    invoke-static {v8, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v8

    const-string v9, "Dancing Script Regular"

    invoke-direct {v2, v5, v7, v8, v9}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v6

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v5, "system.cursiveb"

    const-string v7, "android"

    const-string v8, "cursive"

    invoke-static {v8, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v8

    const-string v9, "Dancing Script Bold"

    invoke-direct {v2, v5, v7, v8, v9}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v3

    new-instance v2, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;

    const-string v3, "system.mono"

    const-string v5, "android"

    const-string v7, "monospace"

    invoke-static {v7, v6}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v6

    const-string v7, "Droid Sans Mono"

    invoke-direct {v2, v3, v5, v6, v7}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Typeface;Ljava/lang/String;)V

    aput-object v2, v1, v4

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_12
    return-object v0
.end method

.method private static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-char v3, p0, v2

    const/16 v4, 0x5f

    if-eq v3, v4, :cond_1

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_1

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
