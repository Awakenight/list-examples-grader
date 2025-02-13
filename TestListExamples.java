import static org.junit.Assert.*;
import org.junit.*;
import java.util.List;
import java.util.Arrays;

class StringContainsA implements StringChecker {

  public boolean checkString(String s) {
    return s.contains("a");
  }

}

public class TestListExamples {
  // Write your grading tests here!
  @Test(timeout=100)
  public void testFilter() {
    List<String> expected = Arrays.asList(new String[] {"a", "ab"}); 
    List<String> toBeFilter = Arrays.asList(new String[] {"a", "bc", "ab"});

    List<String> filtered = ListExamples.filter(toBeFilter, new StringContainsA());

    assertEquals(expected, filtered);
  }

  @Test(timeout=100)
  public void testMerge() {
    List<String> expected = Arrays.asList(new String[] {"a", "a", "b", "b", "c", "c"});
    List<String> toBeMerged = Arrays.asList(new String[] {"a", "b", "c"});

    List<String> merged = ListExamples.merge(toBeMerged, toBeMerged);

    assertEquals(expected, merged);
  }

}
