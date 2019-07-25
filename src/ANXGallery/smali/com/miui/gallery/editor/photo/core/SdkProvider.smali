.class public abstract Lcom/miui/gallery/editor/photo/core/SdkProvider;
.super Ljava/lang/Object;
.source "SdkProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Lcom/miui/gallery/editor/photo/core/Metadata;",
        "F:",
        "Lcom/miui/gallery/editor/photo/core/RenderFragment;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static DUMMY:Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/RenderScript$Translator<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field private mApplication:Landroid/app/Application;

.field private volatile mInitialized:Z

.field private mNotifyHandler:Landroid/os/Handler;

.field mSupported:Lcom/miui/gallery/editor/photo/core/Effect;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "+",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "TD;TF;>;>;"
        }
    .end annotation
.end field

.field private mTranslator:Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/SdkProvider$1;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkProvider$1;-><init>(Ljava/util/List;)V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->DUMMY:Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;

    return-void
.end method

.method protected constructor <init>(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/core/Effect<",
            "+",
            "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
            "TD;TF;>;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mNotifyHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mSupported:Lcom/miui/gallery/editor/photo/core/Effect;

    return-void
.end method


# virtual methods
.method attach(Landroid/app/Application;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mApplication:Landroid/app/Application;

    return-void
.end method

.method public abstract createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
.end method

.method public final createFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TF;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "RenderFragment:effect"

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mSupported:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method protected final getApplicationContext()Landroid/app/Application;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mApplication:Landroid/app/Application;

    return-object v0
.end method

.method public initialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mInitialized:Z

    return v0
.end method

.method public abstract list()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+TD;>;"
        }
    .end annotation
.end method

.method protected final notifyInitializeFinish()V
    .locals 2

    const-string v0, "SdkProvider"

    const-string v1, "%s initialize finish, post notify task"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mInitialized:Z

    return-void
.end method

.method protected onActivityCreate()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->onCreateTranslator()Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->mTranslator:Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;

    return-void
.end method

.method protected abstract onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TF;"
        }
    .end annotation
.end method

.method protected onCreateTranslator()Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkProvider;->DUMMY:Lcom/miui/gallery/editor/photo/core/RenderScript$Translator;

    return-object v0
.end method
