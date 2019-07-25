.class Lcom/miui/gallery/ui/HomePageFragment$6;
.super Ljava/lang/Object;
.source "HomePageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/HomePageFragment;->onDataBind()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$6;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$6;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$1300(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/activity/HomePageStartupHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->onStartup()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$6;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageFragment;->onStartup()V

    return-void
.end method
