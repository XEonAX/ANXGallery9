.class public final synthetic Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditorActivity$uHMJmiyxapmZgHP5gNaoNTi5VDk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditorActivity$uHMJmiyxapmZgHP5gNaoNTi5VDk;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    return-void
.end method


# virtual methods
.method public final run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenEditorActivity$uHMJmiyxapmZgHP5gNaoNTi5VDk;->f$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->lambda$deleteFile$69(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
