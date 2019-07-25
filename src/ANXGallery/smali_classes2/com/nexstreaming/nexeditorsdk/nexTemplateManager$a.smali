.class final Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;
.super Landroid/os/AsyncTask;
.source "nexTemplateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field a:Lcom/nexstreaming/nexeditorsdk/nexProject;

.field b:Ljava/lang/String;

.field c:Ljava/lang/Runnable;

.field d:Z

.field final synthetic e:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;

.field private f:Z


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;ZLjava/lang/Runnable;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->e:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->a:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->b:Ljava/lang/String;

    iput-object p5, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->c:Ljava/lang/Runnable;

    iput-boolean p4, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->d:Z

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4

    :try_start_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->e:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->a:Lcom/nexstreaming/nexeditorsdk/nexProject;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->b:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->d:Z

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;->NONE:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexUndetectedFaceCrop;->getValue()I

    move-result v3

    invoke-static {p1, v0, v1, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;->access$300(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;ZI)Z

    move-result p1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->f:Z
    :try_end_0
    .catch Lcom/nexstreaming/nexeditorsdk/exception/ExpiredTimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ExpiredTimeException;->printStackTrace()V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected a(Ljava/lang/Void;)V
    .locals 0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->e:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;->access$400(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->c:Ljava/lang/Runnable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->c:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;->access$502(Z)Z

    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->a([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$a;->a(Ljava/lang/Void;)V

    return-void
.end method
