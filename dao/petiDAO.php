<?php

require_once "db/connection.php";
require_once "classes/peti.php";

class petiDAO
{
    public function remove($pe){
        global $pdo;
        try {
            $statement = $pdo->prepare("DELETE FROM tb_peti WHERE idtb_peti = :id");
            $statement->bindValue(":id", $pe->getIdtbPeti());
            if ($statement->execute()) {
                return "<script> alert('Registo foi excluído com êxito !'); </script>";
            } else {
                throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
            }
        } catch (PDOException $erro) {
            return "Erro: ".$erro->getMessage();
        }
    }

    public function save($pe){
        global $pdo;
        try {
            if ($pe->getIdtbPeti() != "") {
                $statement = $pdo->prepare("UPDATE tb_peti SET  str_year=:str_year,str_month=:str_month,str_benefit_situation=:str_benefit_situation,db_value_plot=:db_value_plot, tb_city_id_city=:tb_city_id_city ,tb_beneficiaries_id_beneficiaries=:tb_beneficiaries_id_beneficiaries  WHERE idtb_peti = :id;");
                $statement->bindValue(":id", $pe->getIdtbPeti());
            } else {
                $statement = $pdo->prepare("INSERT INTO tb_peti (str_year, str_month, str_benefit_situation , db_value_plot, tb_city_id_city, tb_beneficiaries_id_beneficiaries) VALUES (:str_month, :str_year, :str_benefit_situation, :db_value_plot, :tb_city_id_city, :tb_beneficiaries_id_beneficiaries)");
            }

            $statement->bindValue(":str_year",$pe->getStrYear());
            $statement->bindValue(":str_month",$pe->getStrMonth());
            $statement->bindValue(":str_benefit_situation",$pe->getStrBenefitSituation());
            $statement->bindValue(":db_value_plot",$pe->getDbValuePlot());
            $statement->bindValue(":tb_city_id_city",$pe->getTbCityIdCity());
            $statement->bindValue(":tb_beneficiaries_id_beneficiaries",$pe->getTbBeneficiariesIdBeneficiaries());

            if ($statement->execute()) {
                if ($statement->rowCount() > 0) {
                    return "<script> alert('Dados cadastrados com sucesso !'); </script>";
                } else {
                    return "<script> alert('Erro ao tentar efetivar cadastro !'); </script>";
                }
            } else {
                throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
            }
        } catch (PDOException $erro) {
            return "Erro: " . $erro->getMessage();
        }
    }

    public function atualizar($pe){
        global $pdo;
        try {
            $statement = $pdo->prepare("SELECT idtb_peti, str_year, str_month, str_benefit_situation, db_value_plot, tb_city_id_city, tb_beneficiaries_id_beneficiaries FROM tb_peti WHERE idtb_peti = :id");
            $statement->bindValue(":id", $pe->getIdtbPeti());
            if ($statement->execute()) {
                $rs = $statement->fetch(PDO::FETCH_OBJ);
                $pe->setIdtbPeti($rs->idtb_peti);
                $pe->setStrYear($rs->str_year);
                $pe->setStrMonth($rs->str_month);
                $pe->setStrBenefitSituation($rs->str_benefit_situation);
                $pe->setDbValuePlot($rs->db_value_plot);
                $pe->setTbCityIdCity($rs->tb_city_id_city);
                $pe->setTbBeneficiariesIdBeneficiaries($rs->tb_beneficiaries_id_beneficiaries);
                return $pe;
            } else {
                throw new PDOException("<script> alert('Não foi possível executar a declaração SQL !'); </script>");
            }
        } catch (PDOException $erro) {
            return "Erro: ".$erro->getMessage();
        }
    }

    public function tabelapaginada() {

        //carrega o banco
        global $pdo;

        //endereço atual da página
        $endereco = $_SERVER ['PHP_SELF'];

        /* Constantes de configuração */
        define('QTDE_REGISTROS', 10);
        define('RANGE_PAGINAS', 1);

        /* Recebe o número da página via parâmetro na URL */
        $pagina_atual = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;

        /* Calcula a linha inicial da consulta */
        $linha_inicial = ($pagina_atual -1) * QTDE_REGISTROS;

        /* Instrução de consulta para paginação com MySQL */
        $sql = "select p.idtb_peti, p.str_month,p.str_year,s.str_uf,c.str_cod_siafi_city,c.str_name_city,b.str_nis,b.str_name_person,p.str_benefit_situation,p.db_value_plot from tb_peti p inner join tb_city c on p.tb_city_id_city = c.id_city inner join tb_beneficiaries b on p.tb_beneficiaries_id_beneficiaries = b.id_beneficiaries inner join tb_state s on c.tb_state_id_state = s.id_state LIMIT {$linha_inicial}, " . QTDE_REGISTROS;
        $statement = $pdo->prepare($sql);
        $statement->execute();
        $dados = $statement->fetchAll(PDO::FETCH_OBJ);

        /* Conta quantos registos existem na tabela */
        $sqlContador = "SELECT COUNT(*) AS total_registros FROM tb_fisherman_insurance";
        $statement = $pdo->prepare($sqlContador);
        $statement->execute();
        $valor = $statement->fetch(PDO::FETCH_OBJ);

        /* Idêntifica a primeira página */
        $primeira_pagina = 1;

        /* Cálcula qual será a última página */
        $ultima_pagina  = ceil($valor->total_registros / QTDE_REGISTROS);

        /* Cálcula qual será a página anterior em relação a página atual em exibição */
        $pagina_anterior = ($pagina_atual > 1) ? $pagina_atual -1 : 0 ;

        /* Cálcula qual será a pŕoxima página em relação a página atual em exibição */
        $proxima_pagina = ($pagina_atual < $ultima_pagina) ? $pagina_atual +1 : 0 ;

        /* Cálcula qual será a página inicial do nosso range */
        $range_inicial  = (($pagina_atual - RANGE_PAGINAS) >= 1) ? $pagina_atual - RANGE_PAGINAS : 1 ;

        /* Cálcula qual será a página final do nosso range */
        $range_final   = (($pagina_atual + RANGE_PAGINAS) <= $ultima_pagina ) ? $pagina_atual + RANGE_PAGINAS : $ultima_pagina ;

        /* Verifica se vai exibir o botão "Primeiro" e "Pŕoximo" */
        $exibir_botao_inicio = ($range_inicial < $pagina_atual) ? 'mostrar' : 'esconder';

        /* Verifica se vai exibir o botão "Anterior" e "Último" */
        $exibir_botao_final = ($range_final > $pagina_atual) ? 'mostrar' : 'esconder';

        if (!empty($dados)):
            echo "
     <table class='table table-striped table-bordered'>
     <thead>
       <tr style='text-transform: uppercase;' class='active'>
        <th style='text-align: center; font-weight: bolder;'>Year</th>
        <th style='text-align: center; font-weight: bolder;'>Month</th>
        <th style='text-align: center; font-weight: bolder;'>UF</th>
        <th style='text-align: center; font-weight: bolder;'>CÓDIGO MUNICÍPIO SIAFI</th>
        <th style='text-align: center; font-weight: bolder;'>NOME MUNICÍPIO</th>
        <th style='text-align: center; font-weight: bolder;'>NIS FAVORECIDO</th>
        <th style='text-align: center; font-weight: bolder;'>NOME FAVORECIDO</th>
        <th style='text-align: center; font-weight: bolder;'>SITUAÇÃO BENEFÍCIO</th>
        <th style='text-align: center; font-weight: bolder;'>VALOR PARCELA</th>
        <th style='text-align: center; font-weight: bolder;' colspan='2'>Actions</th>
       </tr>
     </thead>
     <tbody>";
            foreach ($dados as $pe):
                echo "<tr>
        <td style='text-align: center'>$pe->str_year</td>
        <td style='text-align: center'>$pe->str_month</td>
        <td style='text-align: center'>$pe->str_uf</td>
        <td style='text-align: center'>$pe->str_cod_siafi_city</td>
        <td style='text-align: center'>$pe->str_name_city</td>
        <td style='text-align: center'>$pe->str_nis</td>
        <td style='text-align: center'>$pe->str_name_person</td>
        <td style='text-align: center'>$pe->str_benefit_situation</td>
        <td style='text-align: center'>$pe->db_value_plot</td>
        <td style='text-align: center'><a href='?act=upd&id=$pe->idtb_peti' title='Alterar'><i class='ti-reload'></i></a></td>
        <td style='text-align: center'><a href='?act=del&id=$pe->idtb_peti' title='Remover'><i class='ti-close'></i></a></td>
       </tr>";
            endforeach;
            echo "
</tbody>
     </table>

     <div class='box-paginacao' style='text-align: center'>
       <a class='box-navegacao  $exibir_botao_inicio' href='$endereco?page=$primeira_pagina' title='Primeira Página'> FIRST  |</a>
       <a class='box-navegacao  $exibir_botao_inicio' href='$endereco?page=$pagina_anterior' title='Página Anterior'> PREVIOUS  |</a>
";

            /* Loop para montar a páginação central com os números */
            for ($i = $range_inicial; $i <= $range_final; $i++):
                $destaque = ($i == $pagina_atual) ? 'destaque' : '';
                echo "<a class='box-numero $destaque' href='$endereco?page=$i'> ( $i ) </a>";
            endfor;

            echo "<a class='box-navegacao $exibir_botao_final' href='$endereco?page=$proxima_pagina' title='Próxima Página'>| NEXT  </a>
                  <a class='box-navegacao $exibir_botao_final' href='$endereco?page=$ultima_pagina'  title='Última Página'>| LAST  </a>
     </div>";
        else:
            echo "<p class='bg-danger'>Nenhum registro foi encontrado!</p>
     ";
        endif;

    }


}