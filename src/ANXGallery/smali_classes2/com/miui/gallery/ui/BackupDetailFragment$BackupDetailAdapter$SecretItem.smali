.class Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;
.super Ljava/lang/Object;
.source "BackupDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SecretItem"
.end annotation


# instance fields
.field private mCount:I

.field private mSyncIndicator:Landroid/widget/ImageView;

.field private mSyncState:I

.field private mSyncedCount:I

.field private mText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const p1, 0x7f09028b

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mText:Landroid/widget/TextView;

    const p1, 0x7f0902c7

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncIndicator:Landroid/widget/ImageView;

    return-void
.end method

.method private bindSyncState(Landroid/content/Context;IZ)V
    .locals 6

    const v0, 0x7fffffff

    const/16 v1, 0x8

    const v2, 0x7f07020f

    const v3, 0x7f070210

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eq p2, v0, :cond_2

    packed-switch p2, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "unknow status: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    const v2, 0x7f070211

    goto :goto_1

    :pswitch_1
    const p3, 0x7f01000e

    invoke-static {p1, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    :pswitch_2
    const v2, 0x7f070210

    goto :goto_1

    :pswitch_3
    if-eqz p3, :cond_0

    goto :goto_1

    :cond_0
    iget p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncState:I

    const/4 v0, 0x2

    if-eq p3, v0, :cond_1

    const/4 v2, 0x0

    :goto_0
    const/16 v4, 0x8

    goto :goto_1

    :cond_1
    const p3, 0x7f01000d

    invoke-static {p1, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v5

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_1
    iput p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncState:I

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    if-eqz v5, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, v5}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->clearAnimation()V

    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public bindView(Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 6

    const/16 v0, 0xb

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/16 v1, 0x8

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mCount:I

    const/4 v3, 0x0

    if-ne v2, v0, :cond_0

    iget v2, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncedCount:I

    if-eq v1, v2, :cond_1

    :cond_0
    iput v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mCount:I

    iput v1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncedCount:I

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%d/%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v4, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncedCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v4, 0x1

    iget v5, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mText:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    invoke-static {v0, p2}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->access$200(Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;Landroid/database/Cursor;)I

    move-result p2

    iget v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->mSyncState:I

    if-eq v0, p2, :cond_2

    invoke-direct {p0, p1, p2, v3}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter$SecretItem;->bindSyncState(Landroid/content/Context;IZ)V

    :cond_2
    return-void
.end method
