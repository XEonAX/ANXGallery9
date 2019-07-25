.class Lcom/miui/gallery/picker/uri/UriGenerator$6;
.super Ljava/lang/Object;
.source "UriGenerator.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/uri/UriGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/uri/UriGenerator;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$6;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$6;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$800(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$6;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$800(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->cancel()V

    :cond_0
    return-void
.end method
