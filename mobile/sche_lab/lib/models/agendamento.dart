class Agendamento {
  int? id;
  String? startDate;
  String? finalDate;
  Professor? professor;
  Turma? turma;

  Agendamento(
      {this.id, this.startDate, this.finalDate, this.professor, this.turma});

  Agendamento.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    finalDate = json['finalDate'];
    professor = json['professor'] != null
        ? new Professor.fromJson(json['professor'])
        : null;
    turma = json['turma'] != null ? new Turma.fromJson(json['turma']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['finalDate'] = this.finalDate;
    if (this.professor != null) {
      data['professor'] = this.professor!.toJson();
    }
    if (this.turma != null) {
      data['turma'] = this.turma!.toJson();
    }
    return data;
  }
}

class Professor {
  int? id;
  String? matricula;
  String? email;
  String? senha;
  String? nome;

  Professor({this.id, this.matricula, this.email, this.senha, this.nome});

  Professor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matricula = json['matricula'];
    email = json['email'];
    senha = json['senha'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matricula'] = this.matricula;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['nome'] = this.nome;
    return data;
  }
}

class Turma {
  int? id;
  String? curso;
  int? periodo;
  String? turno;

  Turma({this.id, this.curso, this.periodo, this.turno});

  Turma.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curso = json['curso'];
    periodo = json['periodo'];
    turno = json['turno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curso'] = this.curso;
    data['periodo'] = this.periodo;
    data['turno'] = this.turno;
    return data;
  }
}
