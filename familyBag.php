<?php

require_once "classes/template.php";

require_once "dao/familyBagDAO.php";
require_once "classes/familyBag.php";

$object = new familyBagDAO();

$template = new Template();

$template->header();
$template->sidebar();
$template->mainpanel();


// Verificar se foi enviando dados via POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = (isset($_POST["id"]) && $_POST["id"] != null) ? $_POST["id"] : "";
    $str_year = (isset($_POST["str_year"]) && $_POST["str_year"] != null) ? $_POST["str_year"] : "";
    $str_month = (isset($_POST["str_month"]) && $_POST["str_month"] != null) ? $_POST["str_month"] : "";
    $str_date_withdrawal = (isset($_POST["str_date_withdrawal"]) && $_POST["str_date_withdrawal"] != null) ? $_POST["str_date_withdrawal"] : "";
    $db_value_plot = (isset($_POST["db_value_plot"]) && $_POST["db_value_plot"] != null) ? $_POST["db_value_plot"] : "";
    $tb_city_id_city = (isset($_POST["tb_city_id_city"]) && $_POST["tb_city_id_city"] != null) ? $_POST["tb_city_id_city"] : "";
    $tb_beneficiaries_id_beneficiaries = (isset($_POST["tb_beneficiaries_id_beneficiaries"]) && $_POST["tb_beneficiaries_id_beneficiaries"] != null) ? $_POST["tb_beneficiaries_id_beneficiaries"] : "";
} else if (!isset($id)) {
    // Se não se não foi setado nenhum valor para variável $id
    $id = (isset($_GET["id"]) && $_GET["id"] != null) ? $_GET["id"] : "";
    $str_year = null;
    $str_month = null;
    $str_date_withdrawal = null;
    $db_value_plot = null;
    $tb_city_id_city = null;
    $tb_beneficiaries_id_beneficiaries = null;


}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "upd" && $id != "") {

    $familyBag = new familyBag($id, '', '', '','','','');

    $resultado = $object->atualizar($familyBag);
    $str_year = $resultado->getStrYear();
    $str_month = $resultado->getStrMonth();
    $str_date_withdrawal = $resultado->getStrDateWithdrawal();
    $db_value_plot = $resultado->getDbValuePlot();
    $tb_city_id_city = $resultado->getTbCityIdCity();
    $tb_beneficiaries_id_beneficiaries = $resultado->getTbBeneficiariesIdBeneficiaries();

}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "save" && $str_year != "" && $str_month!= "" && $db_value_plot!= ""&& $str_date_withdrawal!= "") {
    $familyBag = new familyBag($id, $str_year, $str_month, $str_date_withdrawal, $db_value_plot, $tb_city_id_city, $tb_beneficiaries_id_beneficiaries);
    $msg = $object->save($familyBag);
    $id = null;
    $str_year = null;
    $str_month = null;
    $str_date_withdrawal = null;
    $db_value_plot = null;
    $tb_city_id_city = null;
    $tb_beneficiaries_id_beneficiaries = null;

}

if (isset($_REQUEST["act"]) && $_REQUEST["act"] == "del" && $id != "") {
    $familyBag = new familyBag($id, '', '', '','','','');
    $msg = $object->remove($familyBag);
    $id = null;
}

?>

<div class='content' xmlns="http://www.w3.org/1999/html">
    <div class='container-fluid'>
        <div class='row'>
            <div class='col-md-12'>
                <div class='card'>
                    <div class='header'>
                        <h4 class='title'>Family Bag</h4>
                        <p class='category'>List of Family Bag of the system</p>

                    </div>
                    <div class='content table-responsive'>

                        <form action="?act=save&id=" method="POST" name="form1">

                            <input type="hidden" name="id" value="<?php
                            // Preenche o id no campo id com um valor "value"
                            echo (isset($id) && ($id != null || $id != "")) ? $id : '';
                            ?>"/>
                            Year:
                            <input class="form-control" type="text" name="str_year" value="<?php
                            // Preenche o nome no campo nome com um valor "value"
                            echo (isset($str_year) && ($str_year != null || $str_year != "")) ? $str_year : '';
                            ?>"/>
                            <br/>
                            Month:
                            <input class="form-control" type="text" maxlength="2" name="str_month" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($str_month) && ($str_month != null || $str_month != "")) ? $str_month : '';
                            ?>"/>
                            <br/>

                            City:
                            <select class="form-control" name="tb_city_id_city">
                                <?php
                                $query = "SELECT * FROM tb_city order by str_name_city;";
                                $statement = $pdo->prepare($query);
                                if ($statement->execute()) {
                                    $result = $statement->fetchAll(PDO::FETCH_OBJ);
                                    foreach ($result as $rs) {
                                        if ($rs->id_city == $tb_city_id_city) {
                                            echo "<option value='$rs->id_city' selected>$rs->str_name_city</option>";
                                        } else {
                                            echo "<option value='$rs->id_city'>$rs->str_name_city</option>";
                                        }
                                    }
                                } else {
                                    throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
                                }
                                ?>
                            </select>
                            <br/>
                            Beneficiaries:
                            <select class="form-control" name="tb_beneficiaries_id_beneficiaries">
                                <?php
                                $query = "SELECT * FROM tb_beneficiaries order by str_name_person;";
                                $statement = $pdo->prepare($query);
                                if ($statement->execute()) {
                                    $result = $statement->fetchAll(PDO::FETCH_OBJ);
                                    foreach ($result as $rs) {
                                        if ($rs->id_beneficiaries == $tb_beneficiaries_id_beneficiaries) {
                                            echo "<option value='$rs->id_beneficiaries' selected>$rs->str_name_person</option>";
                                        } else {
                                            echo "<option value='$rs->id_beneficiaries'>$rs->str_name_person</option>";
                                        }
                                    }
                                } else {
                                    throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
                                }
                                ?>
                            </select>
                            <br/>
                            Date Withdrawal:
                            <input class="form-control" type="date" name="str_date_withdrawal" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($str_date_withdrawal) && ($str_date_withdrawal != null || $str_date_withdrawal != "")) ? $str_date_withdrawal : '';
                            ?>"/>
                            <br/>
                            Value Plot:
                            <input class="form-control" type="number" name="db_value_plot" value="<?php
                            // Preenche o sigla no campo sigla com um valor "value"
                            echo (isset($db_value_plot) && ($db_value_plot != null || $db_value_plot != "")) ? $db_value_plot : '';
                            ?>"/>
                            <br/>

                            <input class="btn btn-success" type="submit" value="REGISTER">
                            <hr>
                        </form>


                        <?php

                        echo (isset($msg) && ($msg != null || $msg != "")) ? $msg : '';

                        //chamada a paginação
                        $object->tabelapaginada();

                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php
$template->footer();
?>
