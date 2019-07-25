.class Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;
.super Ljava/lang/Object;
.source "DeleteMediaDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/DeleteMediaDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CheckBoxInfo"
.end annotation


# instance fields
.field final defaultValue:Z

.field final message:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

.field final type:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->type:I

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->genMessage(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->message:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->genDefaultValue(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->defaultValue:Z

    return-void
.end method

.method private genDefaultValue(I)Z
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eq p1, v1, :cond_0

    return v0

    :cond_0
    return v0
.end method

.method private genMessage(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v0, 0x7f1002f8

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
