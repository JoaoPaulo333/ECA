-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 28-Set-2018 às 15:01
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_eca`
--
CREATE DATABASE IF NOT EXISTS `db_eca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_eca`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_action`
--

CREATE TABLE `tb_action` (
  `id_action` int(11) NOT NULL,
  `str_cod_action` varchar(4) NOT NULL,
  `str_name_action` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_beneficiaries`
--

CREATE TABLE `tb_beneficiaries` (
  `id_beneficiaries` bigint(20) NOT NULL,
  `str_nis` varchar(14) NOT NULL,
  `str_name_person` varchar(255) NOT NULL,
  `str_cpf` varchar(14) DEFAULT NULL,
  `int_rgp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_beneficiaries`
--

INSERT INTO `tb_beneficiaries` (`id_beneficiaries`, `str_nis`, `str_name_person`, `str_cpf`, `int_rgp`) VALUES
(1, '213124412', 'Joao', '11685234912', 0),
(2, '654123561', 'ana', '11650024682', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_city`
--

CREATE TABLE `tb_city` (
  `id_city` int(11) NOT NULL,
  `str_name_city` varchar(255) DEFAULT NULL,
  `str_cod_siafi_city` varchar(4) NOT NULL,
  `tb_state_id_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_city`
--

INSERT INTO `tb_city` (`id_city`, `str_name_city`, `str_cod_siafi_city`, `tb_state_id_state`) VALUES
(2, 'Juiz de Fora', '3605', 2),
(3, 'Natal', '3600', 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_family_bag`
--

CREATE TABLE `tb_family_bag` (
  `idtb_family_bag` int(11) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `str_month` varchar(2) NOT NULL,
  `str_date_withdrawal` varchar(12) NOT NULL,
  `db_value_plot` double NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_family_bag`
--

INSERT INTO `tb_family_bag` (`idtb_family_bag`, `str_year`, `str_month`, `str_date_withdrawal`, `db_value_plot`, `tb_city_id_city`, `tb_beneficiaries_id_beneficiaries`) VALUES
(1, '2015', '05', '2018-09-09', 200, 3, 2),
(3, '2015', '06', '2018-09-04', 859, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_files`
--

CREATE TABLE `tb_files` (
  `id_file` int(11) NOT NULL,
  `str_name_file` varchar(45) NOT NULL,
  `str_month` varchar(2) DEFAULT NULL,
  `str_year` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fisherman_insurance`
--

CREATE TABLE `tb_fisherman_insurance` (
  `idtb_fisherman_insurance` int(11) NOT NULL,
  `str_month` varchar(2) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `db_value` double NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_city_id_city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_fisherman_insurance`
--

INSERT INTO `tb_fisherman_insurance` (`idtb_fisherman_insurance`, `str_month`, `str_year`, `db_value`, `tb_beneficiaries_id_beneficiaries`, `tb_city_id_city`) VALUES
(1, '03', '2015', 510, 1, 2),
(4, '06', '2015', 600, 2, 3),
(5, '04', '2002', 902, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_functions`
--

CREATE TABLE `tb_functions` (
  `id_function` int(11) NOT NULL,
  `str_cod_function` varchar(4) NOT NULL,
  `str_name_function` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_guarantee_crop`
--

CREATE TABLE `tb_guarantee_crop` (
  `idtb_guarantee_crop` int(11) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `str_month` varchar(2) NOT NULL,
  `db_value` double NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_guarantee_crop`
--

INSERT INTO `tb_guarantee_crop` (`idtb_guarantee_crop`, `str_year`, `str_month`, `db_value`, `tb_city_id_city`, `tb_beneficiaries_id_beneficiaries`) VALUES
(1, '2018', '03', 300, 2, 1),
(2, '2015', '03', 3250, 2, 1),
(3, '2015', '06', 600, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_payments`
--

CREATE TABLE `tb_payments` (
  `id_payment` bigint(20) NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_functions_id_function` int(11) NOT NULL,
  `tb_subfunctions_id_subfunction` int(11) NOT NULL,
  `tb_program_id_program` int(11) NOT NULL,
  `tb_action_id_action` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL,
  `tb_source_id_source` int(11) NOT NULL,
  `tb_files_id_file` int(11) NOT NULL,
  `db_value` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_peti`
--

CREATE TABLE `tb_peti` (
  `idtb_peti` int(11) NOT NULL,
  `str_year` varchar(4) NOT NULL,
  `str_month` varchar(2) NOT NULL,
  `str_benefit_situation` varchar(45) NOT NULL,
  `db_value_plot` double NOT NULL,
  `tb_city_id_city` int(11) NOT NULL,
  `tb_beneficiaries_id_beneficiaries` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_peti`
--

INSERT INTO `tb_peti` (`idtb_peti`, `str_year`, `str_month`, `str_benefit_situation`, `db_value_plot`, `tb_city_id_city`, `tb_beneficiaries_id_beneficiaries`) VALUES
(1, '2020', '03', 'Sacado', 90, 2, 1),
(3, '2015', '05', 'Não Sacado', 60, 3, 2),
(9, '2018', '06', 'Não Sacado', 80, 2, 1),
(10, '2015', '06', 'Sacado', 69, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_program`
--

CREATE TABLE `tb_program` (
  `id_program` int(11) NOT NULL,
  `str_cod_program` varchar(4) NOT NULL,
  `str_name_program` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_region`
--

CREATE TABLE `tb_region` (
  `id_region` int(11) NOT NULL,
  `str_name_region` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_region`
--

INSERT INTO `tb_region` (`id_region`, `str_name_region`) VALUES
(3, 'Nordeste'),
(1, 'Sudeste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_source`
--

CREATE TABLE `tb_source` (
  `id_source` int(11) NOT NULL,
  `str_goal` varchar(255) NOT NULL,
  `str_origin` varchar(255) DEFAULT NULL,
  `str_periodicity` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_state`
--

CREATE TABLE `tb_state` (
  `id_state` int(11) NOT NULL,
  `str_uf` varchar(2) NOT NULL,
  `str_name` varchar(19) DEFAULT NULL,
  `tb_region_id_region` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_state`
--

INSERT INTO `tb_state` (`id_state`, `str_uf`, `str_name`, `tb_region_id_region`) VALUES
(2, 'MG', 'Minas Gerais', 1),
(13, 'RN', 'Rio Grande do Norte', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_subfunctions`
--

CREATE TABLE `tb_subfunctions` (
  `id_subfunction` int(11) NOT NULL,
  `str_cod_subfunction` varchar(4) NOT NULL,
  `str_name_subfunction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `iduser` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `perfil` varchar(45) NOT NULL,
  `resetar` tinyint(4) DEFAULT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_user`
--

INSERT INTO `tb_user` (`iduser`, `login`, `senha`, `nome`, `perfil`, `resetar`, `email`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Joao', 'ADMIN', NULL, 'Joao@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_action`
--
ALTER TABLE `tb_action`
  ADD PRIMARY KEY (`id_action`),
  ADD UNIQUE KEY `str_cod_action_UNIQUE` (`str_cod_action`);

--
-- Indexes for table `tb_beneficiaries`
--
ALTER TABLE `tb_beneficiaries`
  ADD PRIMARY KEY (`id_beneficiaries`);

--
-- Indexes for table `tb_city`
--
ALTER TABLE `tb_city`
  ADD PRIMARY KEY (`id_city`),
  ADD UNIQUE KEY `str_cod_siafi_city_UNIQUE` (`str_cod_siafi_city`),
  ADD KEY `fk_tb_city_tb_state_idx` (`tb_state_id_state`);

--
-- Indexes for table `tb_family_bag`
--
ALTER TABLE `tb_family_bag`
  ADD PRIMARY KEY (`idtb_family_bag`),
  ADD KEY `fk_tb_family_bag_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`),
  ADD KEY `fk_tb_family_bag_tb_city1_idx` (`tb_city_id_city`);

--
-- Indexes for table `tb_files`
--
ALTER TABLE `tb_files`
  ADD PRIMARY KEY (`id_file`),
  ADD UNIQUE KEY `str_name_file_UNIQUE` (`str_name_file`);

--
-- Indexes for table `tb_fisherman_insurance`
--
ALTER TABLE `tb_fisherman_insurance`
  ADD PRIMARY KEY (`idtb_fisherman_insurance`),
  ADD KEY `fk_tb_fisherman_insurance_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`),
  ADD KEY `fk_tb_fisherman_insurance_tb_city1_idx` (`tb_city_id_city`);

--
-- Indexes for table `tb_functions`
--
ALTER TABLE `tb_functions`
  ADD PRIMARY KEY (`id_function`),
  ADD UNIQUE KEY `str_cod_function_UNIQUE` (`str_cod_function`);

--
-- Indexes for table `tb_guarantee_crop`
--
ALTER TABLE `tb_guarantee_crop`
  ADD PRIMARY KEY (`idtb_guarantee_crop`),
  ADD KEY `fk_tb_guarantee_crop_tb_city1_idx` (`tb_city_id_city`),
  ADD KEY `fk_tb_guarantee_crop_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`);

--
-- Indexes for table `tb_payments`
--
ALTER TABLE `tb_payments`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `fk_tb_payments_tb_city1_idx` (`tb_city_id_city`),
  ADD KEY `fk_tb_payments_tb_program1_idx` (`tb_program_id_program`),
  ADD KEY `fk_tb_payments_tb_action1_idx` (`tb_action_id_action`),
  ADD KEY `fk_tb_payments_tb_source1_idx` (`tb_source_id_source`),
  ADD KEY `fk_tb_payments_tb_files1_idx` (`tb_files_id_file`),
  ADD KEY `fk_tb_payments_tb_functions1_idx` (`tb_functions_id_function`),
  ADD KEY `fk_tb_payments_tb_subfunctions1_idx` (`tb_subfunctions_id_subfunction`),
  ADD KEY `fk_tb_payments_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`);

--
-- Indexes for table `tb_peti`
--
ALTER TABLE `tb_peti`
  ADD PRIMARY KEY (`idtb_peti`),
  ADD KEY `fk_tb_peti_tb_city1_idx` (`tb_city_id_city`),
  ADD KEY `fk_tb_peti_tb_beneficiaries1_idx` (`tb_beneficiaries_id_beneficiaries`);

--
-- Indexes for table `tb_program`
--
ALTER TABLE `tb_program`
  ADD PRIMARY KEY (`id_program`),
  ADD UNIQUE KEY `str_cod_program_UNIQUE` (`str_cod_program`);

--
-- Indexes for table `tb_region`
--
ALTER TABLE `tb_region`
  ADD PRIMARY KEY (`id_region`),
  ADD UNIQUE KEY `str_name_region_UNIQUE` (`str_name_region`);

--
-- Indexes for table `tb_source`
--
ALTER TABLE `tb_source`
  ADD PRIMARY KEY (`id_source`),
  ADD UNIQUE KEY `str_goal_UNIQUE` (`str_goal`);

--
-- Indexes for table `tb_state`
--
ALTER TABLE `tb_state`
  ADD PRIMARY KEY (`id_state`),
  ADD UNIQUE KEY `str_uf_UNIQUE` (`str_uf`),
  ADD UNIQUE KEY `str_name_UNIQUE` (`str_name`),
  ADD KEY `fk_tb_state_tb_region1_idx` (`tb_region_id_region`);

--
-- Indexes for table `tb_subfunctions`
--
ALTER TABLE `tb_subfunctions`
  ADD PRIMARY KEY (`id_subfunction`),
  ADD UNIQUE KEY `str_cod_subfunction_UNIQUE` (`str_cod_subfunction`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_action`
--
ALTER TABLE `tb_action`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_beneficiaries`
--
ALTER TABLE `tb_beneficiaries`
  MODIFY `id_beneficiaries` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_city`
--
ALTER TABLE `tb_city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_family_bag`
--
ALTER TABLE `tb_family_bag`
  MODIFY `idtb_family_bag` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_files`
--
ALTER TABLE `tb_files`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_fisherman_insurance`
--
ALTER TABLE `tb_fisherman_insurance`
  MODIFY `idtb_fisherman_insurance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_functions`
--
ALTER TABLE `tb_functions`
  MODIFY `id_function` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_guarantee_crop`
--
ALTER TABLE `tb_guarantee_crop`
  MODIFY `idtb_guarantee_crop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_payments`
--
ALTER TABLE `tb_payments`
  MODIFY `id_payment` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_peti`
--
ALTER TABLE `tb_peti`
  MODIFY `idtb_peti` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_program`
--
ALTER TABLE `tb_program`
  MODIFY `id_program` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_region`
--
ALTER TABLE `tb_region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_source`
--
ALTER TABLE `tb_source`
  MODIFY `id_source` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_state`
--
ALTER TABLE `tb_state`
  MODIFY `id_state` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_subfunctions`
--
ALTER TABLE `tb_subfunctions`
  MODIFY `id_subfunction` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_city`
--
ALTER TABLE `tb_city`
  ADD CONSTRAINT `fk_tb_city_tb_state` FOREIGN KEY (`tb_state_id_state`) REFERENCES `tb_state` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_family_bag`
--
ALTER TABLE `tb_family_bag`
  ADD CONSTRAINT `fk_tb_family_bag_tb_beneficiaries1_idx` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_family_bag_tb_city1_idx` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_fisherman_insurance`
--
ALTER TABLE `tb_fisherman_insurance`
  ADD CONSTRAINT `fk_tb_fisherman_insurance_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_fisherman_insurance_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_guarantee_crop`
--
ALTER TABLE `tb_guarantee_crop`
  ADD CONSTRAINT `fk_tb_guarantee_crop_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_guarantee_crop_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_payments`
--
ALTER TABLE `tb_payments`
  ADD CONSTRAINT `fk_tb_payments_tb_action1` FOREIGN KEY (`tb_action_id_action`) REFERENCES `tb_action` (`id_action`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_files1` FOREIGN KEY (`tb_files_id_file`) REFERENCES `tb_files` (`id_file`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_functions1` FOREIGN KEY (`tb_functions_id_function`) REFERENCES `tb_functions` (`id_function`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_program1` FOREIGN KEY (`tb_program_id_program`) REFERENCES `tb_program` (`id_program`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_source1` FOREIGN KEY (`tb_source_id_source`) REFERENCES `tb_source` (`id_source`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_payments_tb_subfunctions1` FOREIGN KEY (`tb_subfunctions_id_subfunction`) REFERENCES `tb_subfunctions` (`id_subfunction`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_peti`
--
ALTER TABLE `tb_peti`
  ADD CONSTRAINT `fk_tb_peti_tb_beneficiaries1` FOREIGN KEY (`tb_beneficiaries_id_beneficiaries`) REFERENCES `tb_beneficiaries` (`id_beneficiaries`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_peti_tb_city1` FOREIGN KEY (`tb_city_id_city`) REFERENCES `tb_city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_state`
--
ALTER TABLE `tb_state`
  ADD CONSTRAINT `fk_tb_state_tb_region1` FOREIGN KEY (`tb_region_id_region`) REFERENCES `tb_region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
