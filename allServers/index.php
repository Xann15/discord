<?php
session_start();

$title = "All Servers";
$page = "allServers";

require "../init.php";

if (!isset($_SESSION['app_login'])) {
    header("Location: " . BASEURL . "/login");
    exit;
}


if (isset($_POST['logout'])) {
    session_unset();
    header("refresh:0;url= ");
}

$decryptUserId = decryptData($_SESSION['app_login']);
$getUser = getUser($decryptUserId);

if (isset($_POST['easterEgg'])) {
    $keyword = mysqli_real_escape_string($db, $_POST['keywords']);
    if ($keyword === 'admincg') {
        $_SESSION['app_admin'] = true;
        header("refresh:0;url= ");
        exit;
    }
    header("refresh:0;url= ");
    exit;
}

if (isset($_POST['deleteServer'])) {
    $serverId = $_POST['server_id'];

    $db->query("DELETE FROM servers WHERE server_id = '$serverId'");
    $db->query("DELETE FROM server_members WHERE server_id = '$serverId'");
    $db->query("DELETE FROM server_link WHERE server_id = '$serverId'");
    $db->query("DELETE FROM server_code WHERE server_id = '$serverId'");
    $db->query("DELETE FROM request_to_join_server WHERE server_id = '$serverId'");
}

?>

<?php require "../components/head.php" ?>

<div class="main mt-5">

    <button type="button" onclick="history.back()" class="btn border border-0 py-1 gap-2 fs-4 d-flex">
        <i class="bi bi-arrow-left m-auto"></i>
        <p class="m-auto">Back</p>
    </button>

    <p class="display-5 fw-bold">
        All Server
    </p>
    <ul class="list-group col-12 col-lg-6">
        <?php
        $getAllServer = getAllServer();
        while ($fetch = $getAllServer->fetch_assoc()) :
            $serverId = $fetch['server_id'];
            $serverLink = getServerLink($serverId);
            $getTotalMember = getTotalMember($serverId);
        ?>

            <button onclick="window.location.href='<?= BASEURL ?>/servers/?v=<?= $serverLink['link'] ?>'" class="list-group-item d-flex justify-content-between align-items-center">
                <div class="d-flex gap-2">
                    <img src="../favicon.ico" alt="group" class="d-block mx-auto rounded-3" style="width: 35px; height: 35px;">
                    <p class="server-name m-auto fw-bold"><?= $fetch['server_name'] ?></p>
                </div>
                <div class="d-flex gap-2">
                    <p class="text-muted m-auto"><?= $getTotalMember ?> <span class="bi bi-people"></span></p>
                    <?php if (isset($_SESSION['app_admin'])) { ?>
                        <form action="" method="post">
                            <input type="hidden" name="server_id" value="<?= $serverId ?>">
                            <input type="submit" value="Del" class="btn btn-warning px-4 py-1 rounded-pill m-auto" name="deleteServer">
                        </form>
                    <?php } ?>
                </div>
            </button>

        <?php endwhile; ?>
    </ul>
</div>

<?php require "../components/foot.php" ?>