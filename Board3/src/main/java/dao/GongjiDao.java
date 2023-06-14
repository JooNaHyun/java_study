package dao; // dao 패키지에 속하는 코드

import java.util.List;

import domain.Gongji; // Gongji 클래스를 import

public interface GongjiDao {
    int makeData(); // 데이터를 생성하는 메서드

    List<Gongji> selectAllGongji(int page, int countPerPage); // 특정 페이지와 페이지당 개수를 기준으로 모든 Gongji를 조회하는 메서드

    Gongji selectOneGongji(int id); // 특정 id에 해당하는 Gongji를 조회하는 메서드

    int deleteOneGongji(int id); // 특정 id에 해당하는 Gongji를 삭제하는 메서드

    int updateGongji(Gongji gongji); // Gongji를 업데이트하는 메서드

    int insertGongji(Gongji gongji); // Gongji를 삽입하는 메서드

    int count(); // Gongji의 총 개수를 반환하는 메서드

    List<Gongji> selectAll(); // 모든 Gongji를 조회하는 메서드

    int getCurrentPage(int id, int countPerPage); // 특정 id와 페이지당 개수를 기준으로 현재 페이지를 반환하는 메서드
}
