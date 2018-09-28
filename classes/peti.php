<?php
/**
 * Created by PhpStorm.
 * User: joaop
 * Date: 28/09/2018
 * Time: 05:18
 */

class peti
{
    private $idtb_peti;
    private $str_year;
    private $str_month;
    private $str_benefit_situation;
    private $db_value_plot;
    private $tb_city_id_city;
    private $tb_beneficiaries_id_beneficiaries;

    /**
     * peti constructor.
     * @param $idtb_peti
     * @param $str_year
     * @param $str_month
     * @param $str_benefit_situation
     * @param $db_value_plot
     * @param $tb_city_id_city
     * @param $tb_beneficiaries_id_beneficiaries
     */
    public function __construct($idtb_peti, $str_year, $str_month, $str_benefit_situation, $db_value_plot, $tb_city_id_city, $tb_beneficiaries_id_beneficiaries)
    {
        $this->idtb_peti = $idtb_peti;
        $this->str_year = $str_year;
        $this->str_month = $str_month;
        $this->str_benefit_situation = $str_benefit_situation;
        $this->db_value_plot = $db_value_plot;
        $this->tb_city_id_city = $tb_city_id_city;
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
    }

    /**
     * @return mixed
     */
    public function getIdtbPeti()
    {
        return $this->idtb_peti;
    }

    /**
     * @param mixed $idtb_peti
     */
    public function setIdtbPeti($idtb_peti): void
    {
        $this->idtb_peti = $idtb_peti;
    }

    /**
     * @return mixed
     */
    public function getStrYear()
    {
        return $this->str_year;
    }

    /**
     * @param mixed $str_year
     */
    public function setStrYear($str_year): void
    {
        $this->str_year = $str_year;
    }

    /**
     * @return mixed
     */
    public function getStrMonth()
    {
        return $this->str_month;
    }

    /**
     * @param mixed $str_month
     */
    public function setStrMonth($str_month): void
    {
        $this->str_month = $str_month;
    }

    /**
     * @return mixed
     */
    public function getStrBenefitSituation()
    {
        return $this->str_benefit_situation;
    }

    /**
     * @param mixed $str_benefit_situation
     */
    public function setStrBenefitSituation($str_benefit_situation): void
    {
        $this->str_benefit_situation = $str_benefit_situation;
    }

    /**
     * @return mixed
     */
    public function getDbValuePlot()
    {
        return $this->db_value_plot;
    }

    /**
     * @param mixed $db_value_plot
     */
    public function setDbValuePlot($db_value_plot): void
    {
        $this->db_value_plot = $db_value_plot;
    }

    /**
     * @return mixed
     */
    public function getTbCityIdCity()
    {
        return $this->tb_city_id_city;
    }

    /**
     * @param mixed $tb_city_id_city
     */
    public function setTbCityIdCity($tb_city_id_city): void
    {
        $this->tb_city_id_city = $tb_city_id_city;
    }

    /**
     * @return mixed
     */
    public function getTbBeneficiariesIdBeneficiaries()
    {
        return $this->tb_beneficiaries_id_beneficiaries;
    }

    /**
     * @param mixed $tb_beneficiaries_id_beneficiaries
     */
    public function setTbBeneficiariesIdBeneficiaries($tb_beneficiaries_id_beneficiaries): void
    {
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
    }


}