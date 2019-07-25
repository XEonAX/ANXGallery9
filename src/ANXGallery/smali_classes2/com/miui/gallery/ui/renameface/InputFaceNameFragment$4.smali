.class Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$4;
.super Ljava/lang/Object;
.source "InputFaceNameFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->initEditText()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$4;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$4;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$802(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$4;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->updateNameList()V

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method
