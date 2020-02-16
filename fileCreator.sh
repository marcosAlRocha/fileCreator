echo "Informe o grupo de sua aplicação com o nome do artefato: (Exemplo: com.minhaempresa.minhaapi)"
read basePackageName

echo "Digite o nome da classe principal de sua aplicação, sem a extensão:"
read mainClassName

pathToMainClass=$(find . -name $mainClassName.java -printf '%h\n')
pathToMainClassTest=$(find . -name "$mainClassName"Tests.java -printf '%h\n')

if [ ! -d $pathToMainClass"/domain" ] 
then
	mkdir $pathToMainClass"/domain"
fi

if [ ! -d $pathToMainClass"/service" ] 
then
	mkdir $pathToMainClass"/service"
fi

if [ ! -d $pathToMainClass"/service/serviceImpl" ] 
then
	mkdir $pathToMainClass"/service/serviceImpl"
fi

if [ ! -d $pathToMainClass"/repository" ]
then
	mkdir $pathToMainClass"/repository"
fi	


if [ ! -d $pathToMainClass"/resource" ]
then
	mkdir $pathToMainClass"/resource"
fi

if [ ! -d $pathToMainClassTest"/service" ] 
then
	mkdir $pathToMainClassTest"/service"
fi

if [ ! -d $pathToMainClassTest"/repository" ]
then	
	mkdir $pathToMainClassTest"/repository"
fi	

if [ ! -d $pathToMainClassTest"/resource" ]
then	
	mkdir $pathToMainClassTest"/resource"
fi


while :
do
	read -p "Digite o nome da classe entity ou q para terminar:" class
	if [ $class = q ]
	then
		break
	fi
 
printf "package "$basePackageName".domain;
import java.io.Serializable;
import javax.persistence.*;

@Entity
public class "$class" implements Serializable {

	@Id private Long id$class;

}" > "$pathToMainClass"/domain/"$class".java

  
printf "package "$basePackageName".service;

public interface "$class"Service { 

}" > "$pathToMainClass"/service/"$class"Service.java


printf "package "$basePackageName".service.serviceImpl;

import org.springframework.stereotype.Service;
import "$basePackageName".service."$class"Service;

@Service
public class "$class"ServiceImpl implements "$class"Service {

}" > "$pathToMainClass"/service/serviceImpl/"$class"ServiceImpl.java
  
printf "package "$basePackageName".repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import "$basePackageName".domain."$class";

@Repository
public interface "$class"Repository extends JpaRepository <"$class", Long> { 

}" > "$pathToMainClass"/repository/"$class"Repository.java


printf "package "$basePackageName".resource;

import org.springframework.web.bind.annotation.RestController;

@RestController
public class "$class"Resource {

}" > "$pathToMainClass"/resource/"$class"Resource.java



printf "package "$basePackageName".resource;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ActiveProfiles("\""test"\"")
//@WebMvcTest(controllers = nome da sua classe controller.class)
@AutoConfigureMockMvc
public class "$class"ResourceTest {

}" > "$pathToMainClassTest"/resource/"$class"ResourceTest.java


printf "package "$basePackageName".repository;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ActiveProfiles("\""test"\"")
@DataJpaTest
public class "$class"RepositoryTest {

}" > "$pathToMainClassTest"/repository/"$class"RepositoryTest.java


printf "package "$basePackageName".service;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@ExtendWith(SpringExtension.class)
@ActiveProfiles("\""test"\"")
public class "$class"ServiceTest {

}" > "$pathToMainClassTest"/service/"$class"ServiceTest.java




done