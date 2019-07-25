.class final Lcom/miui/gallery/scanner/MediaScanner$2;
.super Ljava/lang/Object;
.source "MediaScanner.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/scanner/MediaScanner;->scannerCorrectLogic(Landroid/content/Context;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$jc:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

.field final synthetic val$pattern:Ljava/util/regex/Pattern;


# direct methods
.method constructor <init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Ljava/util/regex/Pattern;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$2;->val$jc:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$2;->val$pattern:Ljava/util/regex/Pattern;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$2;->val$jc:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return v0

    :cond_0
    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "\\."

    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    array-length p2, p1

    const/4 v1, 0x2

    if-le p2, v1, :cond_1

    array-length p2, p1

    if-le p2, v1, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$2;->val$pattern:Ljava/util/regex/Pattern;

    array-length v2, p1

    sub-int/2addr v2, v1

    aget-object p1, p1, v2

    invoke-virtual {p2, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-nez p1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    :cond_3
    return v0
.end method
