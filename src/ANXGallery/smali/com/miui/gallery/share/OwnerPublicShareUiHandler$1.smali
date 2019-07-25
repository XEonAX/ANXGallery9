.class Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;
.super Ljava/lang/Object;
.source "OwnerPublicShareUiHandler.java"

# interfaces
.implements Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->tryToChangePublicStatus()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
        "Ljava/lang/Void;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V

    return-void
.end method

.method public onCompletion(Ljava/lang/Void;Ljava/lang/String;IZ)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget-object p1, p1, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->mPublicPreference:Landroid/preference/PreferenceCategory;

    iget-object v0, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {v0}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$000(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Lcom/miui/gallery/share/PublishProgressPreference;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    if-eqz p4, :cond_0

    return-void

    :cond_0
    if-nez p3, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget-object p3, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p3}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p3

    invoke-virtual {p3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p3

    invoke-virtual {p1, p3, p2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p1

    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_1

    const p1, 0x7f1005ba

    goto :goto_0

    :cond_1
    const p1, 0x7f100701

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/share/UIHelper;->toast(I)V

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p2

    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    iget-object p3, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p3}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p3

    invoke-virtual {p3}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p3

    xor-int/lit8 p3, p3, 0x1

    invoke-virtual {p1, p3, p2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->updatePublicPreference(ZLjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p1

    invoke-virtual {p1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_3

    const p1, 0x7f1005b9

    goto :goto_1

    :cond_3
    const p1, 0x7f100700

    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/share/UIHelper;->toast(I)V

    iget-object p1, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p1}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/share/OwnerPublicShareUiHandler$1;->this$0:Lcom/miui/gallery/share/OwnerPublicShareUiHandler;

    invoke-static {p2}, Lcom/miui/gallery/share/OwnerPublicShareUiHandler;->access$100(Lcom/miui/gallery/share/OwnerPublicShareUiHandler;)Landroid/preference/CheckBoxPreference;

    move-result-object p2

    invoke-virtual {p2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    :goto_2
    return-void
.end method
