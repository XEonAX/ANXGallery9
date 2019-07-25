.class Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
.super Ljava/lang/Object;
.source "SettingsSearchProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/SettingsSearchProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Builder"
.end annotation


# instance fields
.field intentAction:Ljava/lang/String;

.field intentTargetPackage:Ljava/lang/String;

.field keywords:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/provider/SettingsSearchProvider;

.field title:Ljava/lang/String;

.field uriString:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/provider/SettingsSearchProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->this$0:Lcom/miui/gallery/provider/SettingsSearchProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->title:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->keywords:Ljava/lang/String;

    const-string p1, "miui.intent.action.APP_SETTINGS"

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentAction:Ljava/lang/String;

    const-string p1, "com.miui.gallery"

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentTargetPackage:Ljava/lang/String;

    const-string p1, ""

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->uriString:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Lcom/miui/gallery/provider/SettingsSearchProvider$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;
    .locals 8

    new-instance v7, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;

    iget-object v1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->this$0:Lcom/miui/gallery/provider/SettingsSearchProvider;

    iget-object v2, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->title:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->keywords:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentAction:Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentTargetPackage:Ljava/lang/String;

    iget-object v6, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->uriString:Ljava/lang/String;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;-><init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v7
.end method

.method public setIntentAction(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentAction:Ljava/lang/String;

    return-object p0
.end method

.method public setIntentTargetPackage(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->intentTargetPackage:Ljava/lang/String;

    return-object p0
.end method

.method public setKeywords(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->keywords:Ljava/lang/String;

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->title:Ljava/lang/String;

    return-object p0
.end method

.method public setUriString(Ljava/lang/String;)Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$Builder;->uriString:Ljava/lang/String;

    return-object p0
.end method
