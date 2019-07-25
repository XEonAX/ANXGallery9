.class Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;
.super Ljava/lang/Object;
.source "BackupTitle.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupTitle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PauseMenuItem"
.end annotation


# instance fields
.field private final hour:I

.field private final itemId:I

.field final synthetic this$0:Lcom/miui/gallery/ui/BackupTitle;

.field private final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BackupTitle;Ljava/lang/String;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->this$0:Lcom/miui/gallery/ui/BackupTitle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->itemId:I

    iput-object p2, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->title:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->hour:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->itemId:I

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->hour:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BackupTitle$PauseMenuItem;->title:Ljava/lang/String;

    return-object p0
.end method
