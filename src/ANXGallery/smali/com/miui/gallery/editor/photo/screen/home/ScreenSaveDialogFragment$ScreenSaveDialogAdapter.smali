.class Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;
.super Landroid/widget/BaseAdapter;
.source "ScreenSaveDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScreenSaveDialogAdapter"
.end annotation


# instance fields
.field private mDatas:[Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 p1, 0x3

    new-array p1, p1, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100609

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p1, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100608

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, p1, v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100607

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    aput-object v0, p1, v1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->mDatas:[Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->mDatas:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->getItem(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->mDatas:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 4

    if-nez p2, :cond_0

    new-instance p2, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    const/4 v0, 0x0

    invoke-direct {p2, p3, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$1;)V

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)Landroid/content/Context;

    move-result-object p3

    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v1, 0x7f0b0133

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p3

    const v0, 0x7f090277

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p2, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;

    move-object v3, p3

    move-object p3, p2

    move-object p2, v3

    :goto_0
    iget-object p2, p2, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;->mTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;->mDatas:[Ljava/lang/String;

    aget-object p1, v0, p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p3
.end method
