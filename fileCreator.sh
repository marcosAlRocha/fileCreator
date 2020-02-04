echo "Digite o nome do pacote base de sua aplicação"
read basePackageName

mkdir domain
mkdir service
mkdir service/serviceImpl
mkdir repository
mkdir resource

while :
do
	read -p "Digite o nome da classe entity ou q para terminar:" class
	if [ $class = q ]
	then
		break
	fi
  printf "package "$basePackageName".domain;\n\nimport java.io.Serializable;\nimport javax.persistence.*;\n\n@Entity\npublic class "$class" implements Serializable {\n @Id\n private Long id$class;\n}" > domain/"$class".java
  printf "package "$basePackageName".service;\n\npublic interface "$class"Service {\n\n}" > service/"$class"Service.java
  printf "package "$basePackageName".service.serviceImpl;\n\nimport org.springframework.stereotype.Service;import "$basePackageName".service."$class"Service;\n\n\n\n@Service\npublic class "$class"ServiceImpl implements "$class"Service {\n\n}" > service/ServiceImpl/"$class"ServiceImpl.java
  printf "package "$basePackageName".repository;\n\nimport org.springframework.data.jpa.repository.JpaRepository;\nimport org.springframework.stereotype.Repository;\nimport "$basePackageName".domain."$class";\n\n@Repository\npublic interface "$class"Repository extends JpaRepository <"$class", Long> {\n\n}" > repository/"$class"Repository.java
  printf "package "$basePackageName".resource;\n\nimport org.springframework.web.bind.annotation.RestController;\n\n@RestController\npublic class "$class"Resource {\n\n}" > resource/"$class"Resource.java
done



