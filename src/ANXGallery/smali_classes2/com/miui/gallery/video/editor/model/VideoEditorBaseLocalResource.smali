.class public Lcom/miui/gallery/video/editor/model/VideoEditorBaseLocalResource;
.super Lcom/miui/gallery/video/editor/model/LocalResource;
.source "VideoEditorBaseLocalResource.java"


# instance fields
.field private mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/model/LocalResource;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/model/VideoEditorBaseLocalResource;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    return-void
.end method
