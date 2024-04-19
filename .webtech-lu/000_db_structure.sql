--
-- Database: `mobile`
--
-- --------------------------------------------------------

--
-- Table structure for table `cars`
--
CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `carmodel_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `fuel_id` int(11) NOT NULL,
  `registration_year` int(11) NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fuels`
--

CREATE TABLE `fuels` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carmodels`
--

CREATE TABLE `carmodels` (
  `id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_carmodel_id` (`carmodel_id`),
  ADD KEY `car_color_id` (`color_id`),
  ADD KEY `car_fuel_id` (`fuel_id`),
  ADD KEY `car_country_id` (`country_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fuels`
--
ALTER TABLE `fuels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `carmodels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carmodel_manufacturer_id` (`manufacturer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fuels`
--
ALTER TABLE `fuels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carmodels`
--
ALTER TABLE `carmodels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `car_color_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `car_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  ADD CONSTRAINT `car_fuel_id` FOREIGN KEY (`fuel_id`) REFERENCES `fuels` (`id`),
  ADD CONSTRAINT `car_carmodel_id` FOREIGN KEY (`carmodel_id`) REFERENCES `carmodels` (`id`);

--
-- Constraints for table `carmodels`
--
ALTER TABLE `carmodels`
  ADD CONSTRAINT `carmodel_manufacturer_id` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`);
