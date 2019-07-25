.class final Lcom/miui/gallery/ui/SyncBar$PanelData;
.super Ljava/lang/Object;
.source "SyncBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SyncBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PanelData"
.end annotation


# instance fields
.field public final desc:Ljava/lang/String;

.field public final listener:Landroid/view/View$OnClickListener;

.field public final showArrow:Z

.field public final title:Ljava/lang/String;

.field public final titleDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;ZLandroid/view/View$OnClickListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/SyncBar$PanelData;->title:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/ui/SyncBar$PanelData;->desc:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/SyncBar$PanelData;->titleDrawable:Landroid/graphics/drawable/Drawable;

    iput-boolean p4, p0, Lcom/miui/gallery/ui/SyncBar$PanelData;->showArrow:Z

    iput-object p5, p0, Lcom/miui/gallery/ui/SyncBar$PanelData;->listener:Landroid/view/View$OnClickListener;

    return-void
.end method
