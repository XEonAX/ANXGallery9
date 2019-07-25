.class Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;
.super Ljava/lang/Object;
.source "SettingsSearchProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/SettingsSearchProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RawData"
.end annotation


# instance fields
.field intentAction:Ljava/lang/String;

.field intentTargetPackage:Ljava/lang/String;

.field keywords:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/provider/SettingsSearchProvider;

.field title:Ljava/lang/String;

.field uriString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/SettingsSearchProvider;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->this$0:Lcom/miui/gallery/provider/SettingsSearchProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->title:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->keywords:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->intentAction:Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->intentTargetPackage:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/provider/SettingsSearchProvider$RawData;->uriString:Ljava/lang/String;

    return-void
.end method
