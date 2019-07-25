.class public final synthetic Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

.field private final synthetic f$1:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;->f$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;->f$1:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;

    return-void
.end method


# virtual methods
.method public final OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;->f$0:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/-$$Lambda$ScreenDoodleMenuFragment$iW7XkxyV3hPxcIIvvw9Qo5i3Jmw;->f$1:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;

    invoke-static {v0, v1, p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;->lambda$onViewCreated$55(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleMenuFragment;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleAdapter;Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z

    move-result p1

    return p1
.end method
