.class public final synthetic Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;

.field private final synthetic f$1:[Ljava/lang/String;

.field private final synthetic f$2:[Ljava/lang/Long;

.field private final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;[Ljava/lang/String;[Ljava/lang/Long;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$0:Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;

    iput-object p2, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$1:[Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$2:[Ljava/lang/Long;

    iput-boolean p4, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$3:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$0:Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;

    iget-object v1, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$1:[Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$2:[Ljava/lang/Long;

    iget-boolean v3, p0, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;->f$3:Z

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->lambda$markDelete$38(Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;[Ljava/lang/String;[Ljava/lang/Long;Z)V

    return-void
.end method
