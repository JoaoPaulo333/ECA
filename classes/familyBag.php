<?php
/**
 * Created by PhpStorm.
 * User: joaop
 * Date: 28/09/2018
 * Time: 07:55
 */

class familyBag
{
    private $idtb_family_bag;
    private $str_year;
    private $str_month;
    private $str_date_withdrawal;
    private $db_value_plot;
    private $tb_city_id_city;
    private $tb_beneficiaries_id_beneficiaries;

    /**
     * familyBag constructor.
     * @param $idtb_family_bag
     * @param $str_year
     * @param $str_month
     * @param $str_date_withdrawal
     * @param $db_value_plot
     * @param $tb_city_id_city
     * @param $tb_beneficiaries_id_beneficiaries
     */
    public function __construct($idtb_family_bag, $str_year, $str_month, $str_date_withdrawal, $db_value_plot, $tb_city_id_city, $tb_beneficiaries_id_beneficiaries)
    {
        $this->idtb_family_bag = $idtb_family_bag;
        $this->str_year = $str_year;
        $this->str_month = $str_month;
        $this->str_date_withdrawal = $str_date_withdrawal;
        $this->db_value_plot = $db_value_plot;
        $this->tb_city_id_city = $tb_city_id_city;
        $this->tb_beneficiaries_id_beneficiaries = $tb_beneficiaries_id_beneficiaries;
    }

    /**
     * @return mixed
     */
    public function getIdtbFamilyBag()
    {
        return $this->idtb_family_bag;
    }

    /**
     * @param mixed $idtb_family_bag
     */
    public function setIdtbFamilyBag($idtb_family_bag): void
    {
        $this->idtb_family_bag = $idtb_family_bag;
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
    public function getStrDateWithdrawal()
    {
        return $this->str_date_withdrawal;
    }

    /**
     * @param mixed $str_date_withdrawal
     */
    public function setStrDateWithdrawal($str_date_withdrawal): void
    {
        $this->str_date_withdrawal = $str_date_withdrawal;
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