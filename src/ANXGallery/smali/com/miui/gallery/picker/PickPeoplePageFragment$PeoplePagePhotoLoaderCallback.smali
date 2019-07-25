.class Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "PickPeoplePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickPeoplePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PeoplePagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;Lcom/miui/gallery/picker/PickPeoplePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickPeoplePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->access$000(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
