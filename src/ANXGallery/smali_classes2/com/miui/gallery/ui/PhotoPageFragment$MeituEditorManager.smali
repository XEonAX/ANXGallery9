.class Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MeituEditorManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MeituEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-void
.end method


# virtual methods
.method protected getTargetPackageName()Ljava/lang/String;
    .locals 1

    const-string v0, "com.mt.mtxx.mtxx"

    return-object v0
.end method

.method protected shouldInsertMediaStore()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
