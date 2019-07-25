.class public Lcom/miui/gallery/editor/photo/app/EditorFragment;
.super Landroid/app/Fragment;
.source "EditorFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/EditorFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object p1

    instance-of v0, p1, Lcom/miui/gallery/editor/photo/utils/Attachable;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/editor/photo/utils/Attachable;

    invoke-interface {p1, p0}, Lcom/miui/gallery/editor/photo/utils/Attachable;->attach(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method
